//
//  WishStoringViewController.swift
//  ararsamsonovPW3
//
//  Created by Artem Samsonov on 13.02.2025.
//

import UIKit

enum ConstantsWishStroning {
    static let numberOfSections: Int = 2
}

final class WishStoringViewController: UIViewController {
    private let table: UITableView = UITableView(frame: .zero)
    private var wishArray: [String] = ["Хочу сдать дз на 10"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        configureTable()
    }
    
    private func configureTable() {
        view.addSubview(table)
        table.backgroundColor = .darkGray
        table.dataSource = self
        table.delegate = self
        table.separatorStyle = .singleLine
        table.layer.cornerRadius = Constants.tableCornerRadius
        
        table.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        table.pinRight(to: view.safeAreaLayoutGuide.trailingAnchor)
        table.pinLeft(to: view.safeAreaLayoutGuide.leadingAnchor)
        table.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor)
        
        table.register(WrittenWishCell.self, forCellReuseIdentifier: WrittenWishCell.reuseId)
        table.register(AddWishCell.self, forCellReuseIdentifier: AddWishCell.reuseId)
    }
}

// MARK: - UITableViewDataSource
extension WishStoringViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return wishArray.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: AddWishCell.reuseId, for: indexPath)
            guard let addCell = cell as? AddWishCell else { return cell }
            
            addCell.addWish = { [weak self] wish in
                self?.wishArray.append(wish)
                self?.table.reloadData()
            }

            return addCell

        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: WrittenWishCell.reuseId, for: indexPath)
            guard let wishCell = cell as? WrittenWishCell else { return cell }
            wishCell.configure(with: wishArray[indexPath.row])
            return wishCell

        default:
            return UITableViewCell()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return ConstantsWishStroning.numberOfSections
    }
}

extension WishStoringViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        guard section == 0 else { return nil }
        let footerView = UIView()
        footerView.backgroundColor = .clear

        return footerView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return section == 0 ? 10 : 0
    }
    
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete && indexPath.section == 1 {
//            wishArray.remove(at: indexPath.row) // Удаляем запись из массива
//            tableView.deleteRows(at: [indexPath], with: .automatic) // Анимированно удаляем строку
//        }
//    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
            guard indexPath.section == 1 else { return nil } // Только для второй секции
            
            let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { [weak self] (_, _, completionHandler) in
                self?.wishArray.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
                completionHandler(true)
            }
            
            // ❗ Настроим цвет и стиль кнопки
            deleteAction.backgroundColor = .clear // Делаем фон прозрачным
            
            let customView = UIView(frame: CGRect(x: 0, y: 0, width: 88, height: tableView.rowHeight))
            customView.backgroundColor = .red
            customView.layer.cornerRadius = 10 // Закругление углов
//            deleteAction.image = customView.asImage() // Конвертируем UIView в картинку
            
            return UISwipeActionsConfiguration(actions: [deleteAction])
        }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return indexPath.section == 1 // Разрешаем редактирование только для секции 1
    }
}
