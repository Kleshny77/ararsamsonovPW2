import UIKit
import CoreData

final class WishStoringViewController: UIViewController {

    // MARK: - Core Data Context
    private var context: NSManagedObjectContext {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError(WishStroningConstants.fatalError)
        }
        return appDelegate.persistentContainer.viewContext
    }
    
    // MARK: - UI Elements
    private let table: UITableView = UITableView(frame: .zero)
    private lazy var wishArray: [Wish] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = WishStroningConstants.backgroundColor
        fetchWishes()
        configureTable()
    }
    
    // MARK: - Core Data Operations
    private final func fetchWishesRequest() -> NSFetchRequest<Wish> {
        let request = Wish.fetchRequest()
        request.sortDescriptors = []
        return request
    }

    private final func fetchWishes() {
        do {
            wishArray = try context.fetch(fetchWishesRequest())
            if wishArray.isEmpty {
                saveWish(text: WishStroningConstants.firstWishText)
            }
        } catch {
            print("Error fetching wishes: \(error)")
        }
    }

    private final func saveWish(text: String) {
        let trimmed = text.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }

        let wish = Wish(context: context)
        wish.text = trimmed
        saveContext()
        wishArray.append(wish)
        table.reloadData()
    }
    
    private final func updateWish(at index: Int, newText: String) {
        wishArray[index].text = newText
        saveContext()
        table.reloadRows(at: [IndexPath(row: index, section: 1)], with: .automatic)
    }
    
    private final func deleteWish(at indexPath: IndexPath) {
        let wishToRemove = wishArray[indexPath.row]
        context.delete(wishToRemove)
        wishArray.remove(at: indexPath.row)
        saveContext()
        table.deleteRows(at: [indexPath], with: .automatic)
    }

    private final func saveContext() {
        do {
            try context.save()
        } catch {
            print("Error saving context: \(error)")
        }
    }
    
    // MARK: - UI Configuration
    private final func configureTable() {
        view.addSubview(table)
        
        table.backgroundColor = WishStroningConstants.backgroundColor
        table.separatorStyle = WishStroningConstants.separatorStyle
        table.layer.cornerRadius = WishStroningConstants.tableCornerRadius
        
        table.dataSource = self
        table.delegate = self
        
        table.pin(to: view.safeAreaLayoutGuide)
        
        table.register(WrittenWishCell.self, forCellReuseIdentifier: WrittenWishCell.reuseId)
        table.register(AddWishCell.self, forCellReuseIdentifier: AddWishCell.reuseId)
    }
}

// MARK: - UITableViewDataSource
extension WishStoringViewController: UITableViewDataSource {

    final func numberOfSections(in tableView: UITableView) -> Int {
        WishStroningConstants.numberOfSections
    }

    final func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        section == WishStroningConstants.indexOfFirstSection ? 1 : wishArray.count
    }
    
    final func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case WishStroningConstants.indexOfFirstSection:
            let cell = tableView.dequeueReusableCell(withIdentifier: AddWishCell.reuseId, for: indexPath) as! AddWishCell
            cell.addWish = { [weak self] wishText in
                self?.saveWish(text: wishText)
            }
            return cell

        case WishStroningConstants.indexOfSecondSection:
            let cell = tableView.dequeueReusableCell(withIdentifier: WrittenWishCell.reuseId, for: indexPath) as! WrittenWishCell
            cell.configure(with: wishArray[indexPath.row].text ?? "")
            return cell
        default:
            return UITableViewCell()
        }
    }
}

// MARK: - UITableViewDelegate
extension WishStoringViewController: UITableViewDelegate {

    final func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        indexPath.section == WishStroningConstants.indexOfFirstSection ? WishStroningConstants.firstSectionHeight : UITableView.automaticDimension
    }

    final func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return WishStroningConstants.estimatedRowHeight
    }
    
    // MARK: Footer
    final func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        section == WishStroningConstants.indexOfFirstSection ? WishStroningConstants.footerHeight : WishStroningConstants.footerHeightDefault
    }
    
    // MARK: Edit Actions
    final func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        guard indexPath.section == WishStroningConstants.indexOfSecondSection else { return nil }
        
        let deleteAction = UIContextualAction(style: .destructive, title: WishStroningConstants.deleteButtonTitle) { [weak self] _, _, completionHandler in
            self?.deleteWish(at: indexPath)
            completionHandler(true)
        }
        deleteAction.image = UIImage(systemName: WishStroningConstants.trashIconName)

        return UISwipeActionsConfiguration(actions: [deleteAction])
    }

    final func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        guard indexPath.section == WishStroningConstants.indexOfSecondSection else { return nil }
        
        let editAction = UIContextualAction(style: .normal, title: WishStroningConstants.editButtonTitle) { [weak self] _, _, completion in
            self?.showEditWishAlert(at: indexPath)
            completion(true)
        }

        editAction.backgroundColor = WishStroningConstants.editBackgroundColor
        editAction.image = UIImage(systemName: WishStroningConstants.editIconName)

        return UISwipeActionsConfiguration(actions: [editAction])
    }

    // MARK: Editing Alert
    private final func showEditWishAlert(at indexPath: IndexPath) {
        let alert = UIAlertController(title: WishStroningConstants.editAlertTitle, message: nil, preferredStyle: .alert)
        alert.addTextField { textField in
            textField.text = self.wishArray[indexPath.row].text
        }
        alert.addAction(UIAlertAction(title: WishStroningConstants.cancelButtonTitle, style: .cancel))
        alert.addAction(UIAlertAction(title: WishStroningConstants.saveButtonTitle, style: .default) { [weak self] _ in
            guard let rawText = alert.textFields?.first?.text else { return }
            let trimmed = rawText.trimmingCharacters(in: .whitespacesAndNewlines)
            guard !trimmed.isEmpty else { return }

            self?.updateWish(at: indexPath.row, newText: trimmed)
        })

        present(alert, animated: true)
    }
}
