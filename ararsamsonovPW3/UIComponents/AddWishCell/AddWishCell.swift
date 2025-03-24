//
//  AddWishCell.swift
//  ararsamsonovPW3
//
//  Created by Artem Samsonov on 02.03.2025.
//

import UIKit

final class AddWishCell: UITableViewCell {
    // MARK: - Reuse Identifier
    static let reuseId: String = AddWishCellConstants.reuseIdName
    
    // MARK: - Callback
    var addWish: ((String) -> Void)?
    
    // MARK: - UI Elements
    private let wishTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .clear
        textView.font = UIFont.systemFont(ofSize: AddWishCellConstants.textViewFontSize)
        textView.isScrollEnabled = true
        textView.isUserInteractionEnabled = true
        textView.textContainerInset = UIEdgeInsets(top: AddWishCellConstants.textContainerInsetTop, left: AddWishCellConstants.textContainerInsetLeft, bottom: AddWishCellConstants.textContainerInsetBottom, right: AddWishCellConstants.textContainerInsetRight)
        textView.layer.borderColor = UIColor.lightGray.cgColor
        textView.layer.borderWidth = AddWishCellConstants.textViewBorderWidth
        textView.layer.cornerRadius = AddWishCellConstants.textViewCornerRadius
        return textView
    }()
    
    private let button: UIButton = {
            let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: AddWishCellConstants.buttonImageName), for: .normal)
        button.tintColor = AddWishCellConstants.buttonTintColor
            return button
        }()
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(AddWishCellConstants.fatalError)
    }
    
    // MARK: - Configuration
    private final func configure(with wish: String) {
        wishTextView.text = wish
    }
    
    // MARK: - UI Setup
    private final func configureUI() {
        selectionStyle = .none
        backgroundColor = .clear
        
        let wrap: UIView = UIView()
        contentView.addSubview(wrap)
        
        wrap.backgroundColor = AddWishCellConstants.wrapBackgroundColor
        wrap.layer.cornerRadius = AddWishCellConstants.wrapCornerRadius
        wrap.pinVertical(to: self)
        wrap.pinHorizontal(to: self, AddWishCellConstants.wrapOffsetH)
        
        wrap.addSubview(wishTextView)
        wishTextView.becomeFirstResponder()
        wishTextView.pinVertical(to: wrap, AddWishCellConstants.wishLabelOffsetV)
        wishTextView.pinLeft(to: wrap, AddWishCellConstants.wishLabelOffsetL)
        wishTextView.pinRight(to: wrap, AddWishCellConstants.wishLabelOffsetR)
        
        wrap.addSubview(button)
        button.pinRight(to: wrap, AddWishCellConstants.buttonOffsetR)
        button.pinCenterY(to: wrap)
        
        
        button.addTarget(self, action: #selector(addWishPressed), for: .touchUpInside)
    }
    
    // MARK: - Actions
    @objc
    private final func addWishPressed() {
        guard let text = wishTextView.text, !text.isEmpty else { return }
        UIView.animate(withDuration: AddWishCellConstants.anumateDuration, animations: {
            self.button.tintColor = AddWishCellConstants.anumateColorTintFirst
        }) { _ in
            UIView.animate(withDuration: AddWishCellConstants.anumateDuration) {
                self.button.tintColor = AddWishCellConstants.anumateColorTintSecond
            }
        }
        addWish?(text)
        wishTextView.text = AddWishCellConstants.textViewDefault
    }
}

