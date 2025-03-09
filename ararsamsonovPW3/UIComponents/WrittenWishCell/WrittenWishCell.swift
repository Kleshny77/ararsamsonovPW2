//
//  WrittenWishCell.swift
//  ararsamsonovPW3
//
//  Created by Artem Samsonov on 23.02.2025.
//

import UIKit

final class WrittenWishCell: UITableViewCell {
    // MARK: - Reuse Identifier
    static let reuseId: String = WrittenWishCellConstants.reuseId
    
    private let wishLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = WrittenWishCellConstants.wishLabelNumberOfLines
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.systemFont(ofSize: WrittenWishCellConstants.wishLabelFontSize)
        return label
    }()
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(WrittenWishCellConstants.fatalError)
    }
    
    func configure(with wish: String) {
        wishLabel.text = wish
    }
    
    private func configureUI() {
        selectionStyle = .none
        backgroundColor = .clear
        let wrap: UIView = UIView()
        addSubview(wrap)
        wrap.backgroundColor = WrittenWishCellConstants.wrapBackgroundColor
        wrap.layer.cornerRadius = WrittenWishCellConstants.wrapCornerRadius
        wrap.pinVertical(to: self, WrittenWishCellConstants.wrapOffsetV)
        wrap.pinHorizontal(to: self, WrittenWishCellConstants.wrapOffsetH)
        wrap.addSubview(wishLabel)
        wishLabel.pin(to: wrap, WrittenWishCellConstants.wishLabelOffset)
    }
}
