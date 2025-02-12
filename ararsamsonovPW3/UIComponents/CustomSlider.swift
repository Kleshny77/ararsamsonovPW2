//
//  CustomSlider.swift
//  ararsamsonovPW3
//
//  Created by Артём on 08.11.2024.
//

import UIKit

final class CustomSlider: UIView {
    // MARK: - UI Elements
    private var titleView = UILabel()
    private var valueLabel = UILabel()
    
    // MARK: - Public Properties
    var valueChanged: ((Double) -> Void)?
    var slider = UISlider()
    
    // MARK: - Initializers
    init(title: String, min: Double, max: Double) {
        super.init(frame: .zero)
        
        titleView.text = title
        titleView.font = UIFont.boldSystemFont(ofSize: Constants.sliderTextSize)
        
        slider.minimumValue = Float(min)
        slider.maximumValue = Float(max)
        slider.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
        
        valueLabel.text = String(format: Constants.format, min)
        configureUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constants.fatalError)
    }
    
    // MARK: - UI Configuration
    private func configureUI() {
        backgroundColor = Constants.backgroundColorSlider
        translatesAutoresizingMaskIntoConstraints = false
        
        for view in [slider, titleView, valueLabel] {
            addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        titleView.pinTop(to: topAnchor, Constants.titleViewTop)
        titleView.pinLeft(to: leadingAnchor, Constants.titleViewLeading)
        
        slider.pinTop(to: titleView.bottomAnchor)
        slider.pinBottom(to: bottomAnchor, Constants.sliderBottom)
        slider.pinLeft(to: leadingAnchor, Constants.sliderLeading)
        slider.pinRight(to: trailingAnchor, Constants.sliderTrailing)
        
        valueLabel.pinTop(to: topAnchor, Constants.valueLabelTop)
        valueLabel.pinLeft(to: titleView.trailingAnchor, Constants.valueLabelTrailing)
        valueLabel.pinCenterY(to: titleView.centerYAnchor)
    }
    
    // MARK: - Action Methods
    @objc
    private func sliderValueChanged() {
        let currentValue = Double(slider.value)
        valueLabel.text = String(format: Constants.format, currentValue)
        valueLabel.font = UIFont.systemFont(ofSize: Constants.sliderTextSize)
        valueChanged?(Double(slider.value))
    }
}
