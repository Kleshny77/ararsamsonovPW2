//
//  WishStoringViewController.swift
//  ararsamsonovPW3
//
//  Created by Artem Samsonov on 13.02.2025.
//

import UIKit

final class WishStoringViewController: UIViewController {
    private let table: UITableView = UITableView(frame: .zero)
    private let wishesCount = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        configureTable()
    }
    
    private func configureTable() {
        view.addSubview(table)
        table.backgroundColor = .red
        table.dataSource = self
        table.separatorStyle = .singleLine
        table.layer.cornerRadius = Constants.tableCornerRadius
        
        table.pin(to: view, Constants.tableOffset)
    }
}

// MARK: - UITableViewDataSource
extension WishStoringViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wishesCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "Wish \(indexPath.row + 1)"
        return cell
    }
}
