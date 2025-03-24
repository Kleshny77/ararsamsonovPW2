//
//  CustomSlider.swift
//  ararsamsonovPW3
//
//  Created by Артём on 08.11.2024.
//

import UIKit

final class CustomSlider: UIView {
    // MARK: - UI Elements
    private lazy var titleView = UILabel()
    private lazy var valueLabel = UILabel()
    
    // MARK: - Public Properties
    var valueChanged: ((Double) -> Void)?
    lazy var slider = UISlider()
    
    // MARK: - Initializers
    init(title: String, min: Double, max: Double) {
        super.init(frame: .zero)
        
        titleView.text = title
        titleView.font = UIFont.boldSystemFont(ofSize: CustomSliderConstants.textFontSize)
        
        slider.minimumValue = Float(min)
        slider.maximumValue = Float(max)
        slider.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
        
        valueLabel.text = String(format: CustomSliderConstants.valueLabelFormat, min)
        configureUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(CustomSliderConstants.fatalError)
    }
    
    // MARK: - UI Configuration
    private final func configureUI() {
        backgroundColor = CustomSliderConstants.backgroundColorSlider
        translatesAutoresizingMaskIntoConstraints = false
        
        for view in [slider, titleView, valueLabel] {
            addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        titleView.pinTop(to: topAnchor, CustomSliderConstants.titleViewOffsetTop)
        titleView.pinLeft(to: leadingAnchor, CustomSliderConstants.titleViewOffsetLeft)
        
        slider.pinTop(to: titleView.bottomAnchor)
        slider.pinBottom(to: bottomAnchor, CustomSliderConstants.sliderOffsetBottom)
        slider.pinLeft(to: leadingAnchor, CustomSliderConstants.sliderOffsetLeft)
        slider.pinRight(to: trailingAnchor, CustomSliderConstants.sliderOffsetRight)
        
        valueLabel.pinTop(to: topAnchor, CustomSliderConstants.valueLabelOffsetTop)
        valueLabel.pinLeft(to: titleView.trailingAnchor, CustomSliderConstants.valueLabelOffsetTop)
        valueLabel.pinCenterY(to: titleView.centerYAnchor)
    }
    
    // MARK: - Action Methods
    @objc
    private final func sliderValueChanged() {
        let currentValue = Double(slider.value)
        valueLabel.text = String(format: CustomSliderConstants.valueLabelFormat, currentValue)
        valueLabel.font = UIFont.systemFont(ofSize: CustomSliderConstants.sliderTextFontSize)
        valueChanged?(Double(slider.value))
    }
}
