//
//  AddWishCell.swift
//  ararsamsonovPW3
//
//  Created by Artem Samsonov on 02.03.2025.
//

import UIKit

final class AddWishCell: UITableViewCell {
    static let reuseId: String = "AddWishCell"
    
    var addWish: ((String) -> Void)?
    
    private enum Constants {
        static let wrapColor: UIColor = .white
        static let wrapRadius: CGFloat = 16
        static let wrapOffsetV: CGFloat = 0
        static let wrapOffsetH: CGFloat = 10
        static let wishLabelOffset: CGFloat = 8
    }
    
    private let wishTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .clear
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.isScrollEnabled = true
        textView.isUserInteractionEnabled = true
        textView.textContainerInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        textView.layer.borderColor = UIColor.lightGray.cgColor
        textView.layer.borderWidth = 1
        textView.layer.cornerRadius = 8
        return textView
    }()
    
    private let button: UIButton = {
            let button = UIButton(type: .system)
            button.setImage(UIImage(systemName: "plus"), for: .normal)
            button.tintColor = .blue
            return button
        }()
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with wish: String) {
        wishTextView.text = wish
    }
    
    private func configureUI() {
        selectionStyle = .none
        backgroundColor = .clear
        
        let wrap: UIView = UIView()
        contentView.addSubview(wrap)
        
        wrap.backgroundColor = Constants.wrapColor
        wrap.layer.cornerRadius = Constants.wrapRadius
        wrap.pinVertical(to: self, Constants.wrapOffsetV)
        wrap.pinHorizontal(to: self, Constants.wrapOffsetH)
        
        wrap.addSubview(wishTextView)
        wishTextView.becomeFirstResponder()
        wishTextView.pinVertical(to: wrap, Constants.wishLabelOffset)
        wishTextView.pinLeft(to: wrap, Constants.wishLabelOffset)
        wishTextView.pinRight(to: wrap, Constants.wishLabelOffset + 25)
        
        wrap.addSubview(button)
        button.pinRight(to: wrap, 5)
        button.pinCenterY(to: wrap)
        
        
        button.addTarget(self, action: #selector(addWishPressed), for: .touchUpInside)
    }
    
    @objc private func addWishPressed() {
        guard let text = wishTextView.text, !text.isEmpty else { return }
        UIView.animate(withDuration: 0.1, animations: {
            self.button.tintColor = .gray
        }) { _ in
            UIView.animate(withDuration: 0.1) {
                self.button.tintColor = .blue
            }
        }
        addWish?(text)
        wishTextView.text = ""
    }
}

