//
//  AddWishCellConstants.swift
//  ararsamsonovPW3
//
//  Created by Artem Samsonov on 09.03.2025.
//

import UIKit

enum AddWishCellConstants {
    // MARK: - Reuse Identifier
    static let reuseIdName: String = "AddWishCell"
    
    // MARK: - Wish Text View
    static let textViewFontSize: CGFloat = 16
    static let textContainerInsetTop: CGFloat = 5
    static let textContainerInsetLeft: CGFloat = 5
    static let textContainerInsetBottom: CGFloat = 5
    static let textContainerInsetRight: CGFloat = 5
    static let textViewBorderWidth: CGFloat = 1
    static let textViewCornerRadius: CGFloat = 8
    static let textViewDefault: String = ""
    
    // MARK: - Button
    static let buttonImageName: String = "plus"
    static let buttonTintColor: UIColor = .blue
    static let buttonOffsetR: CGFloat = 5
    
    // MARK: - Errors
    static let fatalError: String = "init(coder:) has not been implemented"
    
    // MARK: - Wrap
    static let wrapBackgroundColor: UIColor = .white
    static let wrapCornerRadius: CGFloat = 16
    static let wrapOffsetH: CGFloat = 10
    
    // MARK: - Wish Label
    static let wishLabelOffsetV: CGFloat = 8
    static let wishLabelOffsetL: CGFloat = 8
    static let wishLabelOffsetR: CGFloat = 32
    
    // MARK: - Animation
    static let anumateDuration: CGFloat = 0.3
    static let anumateColorTintFirst: UIColor = .gray
    static let anumateColorTintSecond: UIColor = .blue
}
