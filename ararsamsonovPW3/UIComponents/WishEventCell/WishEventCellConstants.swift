//
//  WishEventCellConstants.swift
//  ararsamsonovPW3
//
//  Created by Артём on 24.03.2025.
//

import UIKit

enum WishEventCellConstants {
    static let reuseIdentifier = "WishEventCell"
    
    // MARK: - Wrap
    static let backgroundColor: UIColor = .gray
    static let cornerRadius: CGFloat = 8
    
    static let offset: CGFloat = 8
    
    // MARK: - Title Label
    static let titleFont: UIFont = .systemFont(ofSize: 17, weight: .medium)
    static let textColor: UIColor = .darkText
    
    static let titleTop: CGFloat = 2
    static let labelLeading: CGFloat = 4
    
    // MARK: - Description Label
    static let descriptionFont: UIFont = .systemFont(ofSize: 13, weight: .regular)
    static let numberOfLines: Int = 1
    
    static let labelSpacing: CGFloat = 2
    static let descriptionOffsetH: CGFloat = labelLeading
    
    // MARK: - Date Label
    static let dateFont: UIFont = .systemFont(ofSize: 13, weight: .regular)
    
    // MARK: Errors
    static let fatalError: String = "init(coder:) has not been implemented"
    
}
