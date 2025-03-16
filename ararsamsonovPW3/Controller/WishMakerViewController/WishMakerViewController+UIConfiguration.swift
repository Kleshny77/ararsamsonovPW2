//
//  WishMakerViewController+UIConfiguration.swift
//  ararsamsonovPW3
//
//  Created by Артём on 08.11.2024.
//

import UIKit

extension WishMakerViewController {
    // MARK: - Title Configuration
    final func configureTitle() {
        titleLabel.text = WishMakerConstants.titleLabelText
        titleLabel.font = UIFont.boldSystemFont(ofSize: WishMakerConstants.titleLabelFontSize)
        
        titleLabel.backgroundColor = WishMakerConstants.labelBackgroundColor
        titleLabel.tintColor = WishMakerConstants.labelTintColor
        
        titleLabel.layer.cornerRadius = WishMakerConstants.labelCornerRadius
        titleLabel.layer.masksToBounds = true
        titleLabel.layer.borderWidth = WishMakerConstants.labelBorderWidth
        
        titleLabel.setWidth(WishMakerConstants.titleLabelWidth)
        titleLabel.setHeight(WishMakerConstants.titleLabelHeight)
        titleLabel.textAlignment = .center
        
        view.addSubview(titleLabel)
        titleLabel.pinCenterX(to: view)
        titleLabel.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
    }
    
    // MARK: - Description Configuration
    final func configureDescription() {
        descriptionLabel.text = WishMakerConstants.descriptionText
        descriptionLabel.font = UIFont.boldSystemFont(ofSize: WishMakerConstants.descriptionFontSize)
        
        descriptionLabel.backgroundColor = WishMakerConstants.labelBackgroundColor
        descriptionLabel.textColor = WishMakerConstants.labelTintColor
        
        descriptionLabel.layer.cornerRadius = WishMakerConstants.labelCornerRadius
        descriptionLabel.layer.masksToBounds = true
        descriptionLabel.layer.borderWidth = WishMakerConstants.labelBorderWidth
        
        descriptionLabel.setWidth(WishMakerConstants.descriptionLabelWidth)
        descriptionLabel.setHeight(WishMakerConstants.descriptionLabelHeight)
        descriptionLabel.textAlignment = .center
        
        view.addSubview(descriptionLabel)
        descriptionLabel.pinCenterX(to: view)
        descriptionLabel.pinTop(to: titleLabel.bottomAnchor, WishMakerConstants.labelDistance)
    }
    
    // MARK: - Selection Button Configuration
    final func configureMethodSelectionButton() {
        methodSelectionButton.setTitle(WishMakerConstants.methodSelectionButtonTitle, for: .normal)
        methodSelectionButton.addTarget(self, action: #selector(selectColorMethod), for: .touchUpInside)
        
        methodSelectionButton.backgroundColor = WishMakerConstants.labelBackgroundColor
        methodSelectionButton.tintColor = WishMakerConstants.buttonTitleColor
        
        methodSelectionButton.layer.cornerRadius = WishMakerConstants.labelCornerRadius
        methodSelectionButton.layer.borderWidth = WishMakerConstants.labelBorderWidth
        
        methodSelectionButton.setWidth(WishMakerConstants.selectColorMethodButtonWidth)
        methodSelectionButton.setHeight(WishMakerConstants.labelHeight)
        
        view.addSubview(methodSelectionButton)
        methodSelectionButton.pinCenterX(to: view)
        methodSelectionButton.pinTop(to: descriptionLabel.bottomAnchor, WishMakerConstants.labelDistance)
    }
    
    final func configureAddWishButton() {
        view.addSubview(addWishButton)
        
        addWishButton.pinCenterX(to: view)
        addWishButton.setWidth(WishMakerConstants.addWishButtonWidth)
        addWishButton.setHeight(WishMakerConstants.labelHeight)
        addWishButton.pinBottom(to: toggleButton.topAnchor, WishMakerConstants.labelDistance)
        
        addWishButton.backgroundColor = WishMakerConstants.labelBackgroundColor
        addWishButton.setTitleColor(WishMakerConstants.buttonTitleColor, for: .normal)
        addWishButton.setTitle(WishMakerConstants.addWishButtonTitle, for: .normal)
        
        addWishButton.layer.cornerRadius = WishMakerConstants.labelCornerRadius
        addWishButton.layer.borderWidth = WishMakerConstants.labelBorderWidth
        
        addWishButton.addTarget(self, action: #selector(addWishButtonPressed), for: .touchUpInside)
    }
    
    // MARK: - Toggle Button Configuration
    final func configureToggleButton() {
        toggleButton.setTitle(WishMakerConstants.toggleButtonTitle, for: .normal)
        toggleButton.addTarget(self, action: #selector(toggleSliderStackVisibility), for: .touchUpInside)
        
        toggleButton.backgroundColor = WishMakerConstants.labelBackgroundColor
        toggleButton.tintColor = WishMakerConstants.buttonTitleColor
        
        toggleButton.layer.cornerRadius = WishMakerConstants.labelCornerRadius
        toggleButton.layer.borderWidth = WishMakerConstants.labelBorderWidth
        
        toggleButton.setWidth(WishMakerConstants.toggleLabelWidth)
        toggleButton.setHeight(WishMakerConstants.labelHeight)

        view.addSubview(toggleButton)
        toggleButton.pinCenterX(to: view)
        toggleButton.pinBottom(to: sliderStack.topAnchor, 5)
    }
    
    // MARK: - Slider Stack Configuration
    final func configureSliders() {
        sliderStack.axis = .vertical
        view.addSubview(sliderStack)
        sliderStack.layer.cornerRadius = WishMakerConstants.labelCornerRadius
        sliderStack.clipsToBounds = true
        sliderStack.layer.borderWidth = WishMakerConstants.labelBorderWidth
        
        let sliderRed = CustomSlider(title: WishMakerConstants.red, min: WishMakerConstants.minValueUIColor, max: WishMakerConstants.maxValueUIColor)
        let sliderGreen = CustomSlider(title: WishMakerConstants.green, min: WishMakerConstants.minValueUIColor, max: WishMakerConstants.maxValueUIColor)
        let sliderBlue = CustomSlider(title: WishMakerConstants.blue, min: WishMakerConstants.minValueUIColor, max: WishMakerConstants.maxValueUIColor)
        
        sliderRed.tintColor = .red
        sliderGreen.tintColor = .green
        sliderBlue.tintColor = .blue
        
        for slider in [sliderRed, sliderGreen, sliderBlue] {
            sliderStack.addArrangedSubview(slider)
        }
        
        sliderStack.pinLeft(to: view.safeAreaLayoutGuide.leadingAnchor, WishMakerConstants.sliderStackOffset)
        sliderStack.pinRight(to: view.safeAreaLayoutGuide.trailingAnchor, WishMakerConstants.sliderStackOffset)
        
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
    
    final func configureActionStack() {
        actionStack.axis = .vertical
        view.addSubview(actionStack)
        actionStack.spacing = WishMakerConstants.spacing
        for button in [addMoreWishesButton, scheduleWishesButton] {
            actionStack.addArrangedSubview(button)
        }
        configureAddMoreWishes()
        configureScheduleMissions()
        actionStack.pinTop(to: sliderStack.bottomAnchor, WishMakerConstants.sliderStackBottom)
        actionStack.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor, WishMakerConstants.stackBottom)
        actionStack.pinHorizontal(to: view, WishMakerConstants.stackOffsetH)
    }
    
    final private func configureAddMoreWishes() {
        addMoreWishesButton.setTitle(WishMakerConstants.addMoreWishesButtonTitle, for: .normal)
        
        addMoreWishesButton.backgroundColor = WishMakerConstants.labelBackgroundColor
        addMoreWishesButton.tintColor = WishMakerConstants.buttonTitleColor
        
        addMoreWishesButton.layer.cornerRadius = WishMakerConstants.labelCornerRadius
        addMoreWishesButton.layer.borderWidth = WishMakerConstants.labelBorderWidth
        
        addMoreWishesButton.setHeight(WishMakerConstants.labelHeight)
        
        addMoreWishesButton.addTarget(self, action: #selector(addMoreWishesButtonPressed), for: .touchUpInside)
    }
    
    final private func configureScheduleMissions() {
        scheduleWishesButton.setTitle(WishMakerConstants.scheduleWishesButtonTitle, for: .normal)
        
        scheduleWishesButton.backgroundColor = WishMakerConstants.labelBackgroundColor
        scheduleWishesButton.tintColor = WishMakerConstants.buttonTitleColor
        
        scheduleWishesButton.layer.cornerRadius = WishMakerConstants.labelCornerRadius
        scheduleWishesButton.layer.borderWidth = WishMakerConstants.labelBorderWidth
        
        scheduleWishesButton.setHeight(WishMakerConstants.labelHeight)
        
        scheduleWishesButton.addTarget(self, action: #selector(scheduleWishesButtonPressed), for: .touchUpInside)
    }
    
    @objc
    final private func addWishButtonPressed() {
        present(WishStoringViewController(), animated: true)
    }
    
    @objc
    final private func addMoreWishesButtonPressed() {
        // ToDo
    }
    
    @objc
    final private func scheduleWishesButtonPressed() {
        // ToDo
    }
}
