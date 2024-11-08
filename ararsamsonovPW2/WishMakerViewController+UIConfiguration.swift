//
//  WishMakerViewController+UIConfiguration.swift
//  ararsamsonovPW2
//
//  Created by Артём on 08.11.2024.
//

import UIKit

extension WishMakerViewController {
    // MARK: - Title Configuration
    final func configureTitle() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.text = Constants.titleText
        titleLabel.font = UIFont.boldSystemFont(ofSize: Constants.titleFontSize)
        
        titleLabel.backgroundColor = Constants.backgroundColorText
        titleLabel.tintColor = Constants.tintColorText
        
        titleLabel.layer.cornerRadius = Constants.cornerRadius
        titleLabel.layer.masksToBounds = true
        titleLabel.layer.borderWidth = Constants.borderWidth
        
        titleLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: Constants.titleLabelWidthAnchor).isActive = true
        titleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: Constants.titleLabelHeightAnchor).isActive = true
        titleLabel.textAlignment = .center
        
        view.addSubview(titleLabel)
        titleLabel.pinCenterX(to: view)
        titleLabel.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
    }
    
    // MARK: - Description Configuration
    final func configureDescription() {
        descriptionLable.translatesAutoresizingMaskIntoConstraints = false
        
        descriptionLable.text = Constants.descriptionText
        descriptionLable.font = UIFont.boldSystemFont(ofSize: Constants.descriptionFontSize)
        
        descriptionLable.backgroundColor = Constants.backgroundColorText
        descriptionLable.textColor = Constants.tintColorText
        
        descriptionLable.layer.cornerRadius = Constants.cornerRadius
        descriptionLable.layer.masksToBounds = true
        descriptionLable.layer.borderWidth = Constants.borderWidth
        
        descriptionLable.widthAnchor.constraint(greaterThanOrEqualToConstant: Constants.descriptionLableWidthAnchor).isActive = true
        descriptionLable.heightAnchor.constraint(greaterThanOrEqualToConstant: Constants.descriptionLableHeightAnchor).isActive = true
        descriptionLable.textAlignment = .center
        
        view.addSubview(descriptionLable)
        descriptionLable.pinCenterX(to: view)
        descriptionLable.pinTop(to: titleLabel.bottomAnchor, Constants.descriptionTop)
    }
    
    // MARK: - Toggle Button Configuration
    final func configureToggleButton() {
        toggleButton.translatesAutoresizingMaskIntoConstraints = false
        toggleButton.setTitle(Constants.toggleButtonText, for: .normal)
        toggleButton.addTarget(self, action: #selector(toggleSliderStackVisibility), for: .touchUpInside)
        
        toggleButton.backgroundColor = Constants.backgroundColorText
        toggleButton.tintColor = Constants.tintColorText
        
        toggleButton.layer.cornerRadius = Constants.cornerRadius
        toggleButton.layer.borderWidth = Constants.buttonBorderWidth
        
        toggleButton.widthAnchor.constraint(greaterThanOrEqualToConstant: Constants.toggleButtonWidthAnchor).isActive = true
        toggleButton.heightAnchor.constraint(greaterThanOrEqualToConstant: Constants.toggleButtonHeightAnchor).isActive = true

        view.addSubview(toggleButton)
        toggleButton.pinCenterX(to: view)
        toggleButton.pinBottom(to: sliderStack.topAnchor, 5)
    }
    
    // MARK: - Selection Button Configuration
    final func configureMethodSelectionButton() {
        methodSelectionButton.translatesAutoresizingMaskIntoConstraints = false
        methodSelectionButton.setTitle(Constants.methodSelectionButtonTitle, for: .normal)
        methodSelectionButton.addTarget(self, action: #selector(selectColorMethod), for: .touchUpInside)
        
        methodSelectionButton.backgroundColor = Constants.backgroundColorText
        methodSelectionButton.tintColor = Constants.tintColorText
        
        methodSelectionButton.layer.cornerRadius = Constants.cornerRadius
        methodSelectionButton.layer.borderWidth = Constants.buttonBorderWidth
        
        methodSelectionButton.widthAnchor.constraint(greaterThanOrEqualToConstant: Constants.methodSelectionButtonWidthAnchor).isActive = true
        methodSelectionButton.heightAnchor.constraint(greaterThanOrEqualToConstant: Constants.methodSelectionButtonHeightAnchor).isActive = true
        
        view.addSubview(methodSelectionButton)
        methodSelectionButton.pinCenterX(to: view)
        methodSelectionButton.pinTop(to: descriptionLable.bottomAnchor, Constants.methodSelectionButtonTop)
    }
    
    // MARK: - Slider Stack Configuration
    final func configureSliders() {
        sliderStack.translatesAutoresizingMaskIntoConstraints = false
        sliderStack.axis = .vertical
        view.addSubview(sliderStack)
        sliderStack.layer.cornerRadius = Constants.stackRadius
        sliderStack.clipsToBounds = true
        sliderStack.layer.borderWidth = Constants.stackBorderWidth
        
        let sliderRed = CustomSlider(title: Constants.red, min: Constants.sliderMin, max: Constants.sliderMax)
        let sliderGreen = CustomSlider(title: Constants.green, min: Constants.sliderMin, max: Constants.sliderMax)
        let sliderBlue = CustomSlider(title: Constants.blue, min: Constants.sliderMin, max: Constants.sliderMax)
        
        sliderRed.tintColor = .red
        sliderGreen.tintColor = .green
        sliderBlue.tintColor = .blue
        
        for slider in [sliderRed, sliderGreen, sliderBlue] {
            sliderStack.addArrangedSubview(slider)
        }
        
        sliderStack.pinLeft(to: view.safeAreaLayoutGuide.leadingAnchor, Constants.stackLeading)
        sliderStack.pinRight(to: view.safeAreaLayoutGuide.trailingAnchor, Constants.stackLeading)
        sliderStack.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor, Constants.stackBottom)
        
        sliderRed.valueChanged = { [weak self] value in
            self?.upgradeBackgroundColor(red: value, green: Double(sliderGreen.slider.value), blue: Double(sliderBlue.slider.value))
        }
        
        sliderGreen.valueChanged = { [weak self] value in
            self?.upgradeBackgroundColor(red: Double(sliderRed.slider.value), green: value, blue: Double(sliderBlue.slider.value))
        }
        
        sliderBlue.valueChanged = { [weak self] value in
            self?.upgradeBackgroundColor(red: Double(sliderRed.slider.value), green: Double(sliderGreen.slider.value), blue: value)
        }
    }
}

