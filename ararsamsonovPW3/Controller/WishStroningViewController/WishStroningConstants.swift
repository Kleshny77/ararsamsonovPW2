//  WishStroningConstants.swift
//  ararsamsonovPW3
//
//  Created by Artem Samsonov on 09.03.2025.
//

import UIKit

enum WishStroningConstants {
    // MARK: - Sections Configuration
    static let numberOfSections: Int = 2
    static let numberOfFirstSection: Int = 1
    static let numberOfDefaultSection: Int = 0
    static let indexOfFirstSection: Int = 0
    static let indexOfSecondSection: Int = 1
    
    // MARK: - Footer Configuration
    static let footerHeight: CGFloat = 15
    static let footerHeightDefault: CGFloat = 0
    
    // MARK: - Table
    static let backgroundColor: UIColor = .darkGray
    static let tableCornerRadius: CGFloat = 10
    static let separatorStyle: UITableViewCell.SeparatorStyle = .singleLine
    
    // MARK: - Initial Wish Data
    static let firstWishText: String = "Хочу сдать дз на 10"
    
    // MARK: - Swipe Actions
    static let deleteButtonTitle: String = "Удалить"
    static let trashIconName: String = "trash"
    
    static let editButtonTitle: String = "Изменить"
    static let editAlertTitle: String = "Изменить желание"
    static let saveButtonTitle: String = "Сохранить"
    static let cancelButtonTitle: String = "Отмена"
    static let editIconName: String = "pencil"
    static let editBackgroundColor: UIColor = .systemBlue
    
    // MARK: - Header Configuration
    static let headerHeight: CGFloat = 5
    static let headerHeightDefault: CGFloat = 0
    
    // MARK: - Cell Heights
    static let firstSectionHeight: CGFloat = 40
    static let estimatedRowHeight: CGFloat = 80
    
    // MARK: - Errors
    static let fatalError: String = "Could not cast AppDelegate."
}
