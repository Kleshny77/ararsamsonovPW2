//
//  WishEventCell.swift
//  ararsamsonovPW3
//
//  Created by Артём on 24.03.2025.
//

import UIKit

final class WishEventCell: UICollectionViewCell {
    static let reuseIdentifier: String = WishEventCellConstants.reuseIdentifier
    
    private let wrapView: UIView = UIView()
    private let titleLabel: UILabel = UILabel()
    private let descriptionLabel: UILabel = UILabel()
    private let startDateLabel: UILabel = UILabel()
    private let endDateLabel: UILabel = UILabel()
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureWrap()
        configureTitleLabel()
        configureDescriptionLabel()
        configureStartDateLabel()
        configureEndDateLabel()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(WishEventCellConstants.fatalError)
    }
    
    
    // MARK: - Cell Configuration
    final func configure(with event: WishEventModel) {
        titleLabel.text = event.title
        descriptionLabel.text = event.description
        startDateLabel.text = "Start Date: \(event.startDate)"
        endDateLabel.text = "End Date: \(event.endDate)"
    }
    
    // MARK: - UI Configuration
    private final func configureWrap() {
        addSubview(wrapView)
        
        wrapView.layer.cornerRadius = WishEventCellConstants.cornerRadius
        wrapView.backgroundColor = WishEventCellConstants.backgroundColor
        
        wrapView.pin(to: self, WishEventCellConstants.offset)
    }
    
    private final func configureTitleLabel() {
        addSubview(titleLabel)
        
        titleLabel.textColor = WishEventCellConstants.textColor
        titleLabel.font = WishEventCellConstants.titleFont
        
        titleLabel.pinTop(to: wrapView, WishEventCellConstants.titleTop)
        titleLabel.pinLeft(to: wrapView, WishEventCellConstants.labelLeading)
    }
    
    private final func configureDescriptionLabel() {
        addSubview(descriptionLabel)
        
        descriptionLabel.textColor = WishEventCellConstants.textColor
        descriptionLabel.font = WishEventCellConstants.descriptionFont
        descriptionLabel.numberOfLines = WishEventCellConstants.numberOfLines
        
        descriptionLabel.pinTop(to: titleLabel.bottomAnchor, WishEventCellConstants.labelSpacing)
        
        descriptionLabel.pinHorizontal(to: wrapView, WishEventCellConstants.descriptionOffsetH)
    }
    
    private final func configureStartDateLabel() {
        addSubview(startDateLabel)
        
        startDateLabel.textColor = WishEventCellConstants.textColor
        startDateLabel.font = WishEventCellConstants.dateFont
        
        startDateLabel.pinTop(to: descriptionLabel.bottomAnchor, WishEventCellConstants.labelSpacing)
        startDateLabel.pinLeft(to: wrapView, WishEventCellConstants.labelLeading)
    }
    
    private final func configureEndDateLabel() {
        addSubview(endDateLabel)
        
        endDateLabel.textColor = WishEventCellConstants.textColor
        endDateLabel.font = WishEventCellConstants.dateFont
        
        endDateLabel.pinTop(to: descriptionLabel.bottomAnchor, WishEventCellConstants.labelSpacing)
        endDateLabel.pinLeft(to: startDateLabel.trailingAnchor, WishEventCellConstants.labelLeading)
        endDateLabel.pinBottom(to: wrapView, WishEventCellConstants.labelSpacing)
    }
}
