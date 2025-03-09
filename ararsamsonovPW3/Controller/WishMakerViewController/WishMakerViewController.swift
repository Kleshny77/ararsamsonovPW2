//
//  WishMakerViewController.swift
//  ararsamsonovPW3
//
//  Created by Артём on 08.11.2024.
//

import UIKit

final class WishMakerViewController: UIViewController {
    // MARK: - UI Elements
    private lazy var isSliderStackHidden = false
    private lazy var currentColorMethod: ColorMethod = .random
    
    let titleLabel = UILabel()
    let descriptionLabel = UILabel()
    let toggleButton = UIButton(type: .system)
    let methodSelectionButton = UIButton(type: .system)
    let addWishButton: UIButton = UIButton(type: .system)
    let sliderStack = UIStackView()
       
    // MARK: - Lifecycle Methods
    override final func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - UI Configuration
    private final func configureUI() {
        view.backgroundColor = WishMakerConstants.viewBackgroundColor
        
        configureTitle()
        configureDescription()
        configureSliders()
        configureToggleButton()
        configureMethodSelectionButton()
        configureAddWishButton()
    }
    
    // MARK: - Action Methods
    @objc
    func toggleSliderStackVisibility() {
        isSliderStackHidden.toggle()
        if isSliderStackHidden {
            UIView.animate(withDuration: WishMakerConstants.animateDuration, animations: {
                self.sliderStack.alpha = WishMakerConstants.minAlpha
            }) { _ in
                self.sliderStack.isHidden = true
                
                let buttonText = WishMakerConstants.showButtonText
                self.toggleButton.setTitle(buttonText, for: .normal)
            }
        } else {
            self.sliderStack.isHidden = false
            self.sliderStack.alpha = WishMakerConstants.minAlpha
            
            UIView.animate(withDuration: WishMakerConstants.animateDuration, animations: {
                self.sliderStack.alpha = WishMakerConstants.maxAlpha
            }) { _ in
                let buttonText = WishMakerConstants.hideButtonText
                self.toggleButton.setTitle(buttonText, for: .normal)
            }
        }
    }
    
    @objc func selectColorMethod() {
        let alert = UIAlertController(title: WishMakerConstants.methodSelectionButtonTitle, message: nil, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: WishMakerConstants.hex, style: .default, handler: { _ in
            self.currentColorMethod = .hex
            self.showHEXInput()
        }))
        
        alert.addAction(UIAlertAction(title: WishMakerConstants.colorPicker, style: .default, handler: { _ in
            self.currentColorMethod = .colorPicker
            self.showColorPicker()
        }))
        
        alert.addAction(UIAlertAction(title: WishMakerConstants.randomColor, style: .default, handler: { _ in
            self.currentColorMethod = .random
            self.upgradeBackgroundColorWithCurrentMethod()
        }))
        
        alert.addAction(UIAlertAction(title: WishMakerConstants.cancel, style: .cancel, handler: nil))
        
        present(alert, animated: true)
    }
    
    // MARK: - Color Management Methods
    private func upgradeBackgroundColorWithCurrentMethod() {
        switch currentColorMethod {
        case .hex:
            self.showHEXInput()
        case .colorPicker:
            self.showColorPicker()
        case .random:
            self.view.backgroundColor = getUniqueColors()
        }
    }
    
    private func showHEXInput() {
        let alert = UIAlertController(title: WishMakerConstants.hexColorTitle, message: WishMakerConstants.hexColorMessage, preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = WishMakerConstants.hexColorExample
        }
        
        alert.addAction(UIAlertAction(title: WishMakerConstants.cancel, style: .cancel, handler: nil))
        
        alert.addAction(UIAlertAction(title: WishMakerConstants.setColor, style: .default, handler: { _ in
            if let hexText = alert.textFields?.first?.text, let color = UIColor(hex: hexText) {
                self.view.backgroundColor = color
            }
        }))
        
        present(alert, animated: true)
    }
    
    // MARK: - Color Picker
    private func showColorPicker() {
        let colorPicker = UIColorPickerViewController()
        colorPicker.delegate = self
        colorPicker.selectedColor = self.view.backgroundColor ?? .white
        present(colorPicker, animated: true)
    }
}
