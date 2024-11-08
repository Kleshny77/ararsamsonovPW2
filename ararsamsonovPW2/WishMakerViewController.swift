//
//  WishMakerViewController.swift
//  ararsamsonovPW2
//
//  Created by Артём on 08.11.2024.
//

import UIKit

final class WishMakerViewController: UIViewController {
    // MARK: - UI Elements
    private var isSliderStackHidden = false
    private var currentColorMethod: ColorMethod = .random
    
    let titleLabel = UILabel()
    let descriptionLable = UILabel()
    let toggleButton = UIButton(type: .system)
    let methodSelectionButton = UIButton(type: .system)
    let sliderStack = UIStackView()
       
    // MARK: - Lifecycle Methods
    override final func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - UI Configuration
    private final func configureUI() {
        view.backgroundColor = Constants.viewBackgroundColor
        
        configureTitle()
        configureDescription()
        configureSliders()
        configureToggleButton()
        configureMethodSelectionButton()
    }
    
    // MARK: - Action Methods
    @objc
    func toggleSliderStackVisibility() {
        isSliderStackHidden.toggle()
        if isSliderStackHidden {
            UIView.animate(withDuration: Constants.animateDuration, animations: {
                self.sliderStack.alpha = Constants.minAlpha
            }) { _ in
                self.sliderStack.isHidden = true
                
                let buttonText = Constants.showButtonText
                self.toggleButton.setTitle(buttonText, for: .normal)
            }
        } else {
            self.sliderStack.isHidden = false
            self.sliderStack.alpha = Constants.minAlpha
            
            UIView.animate(withDuration: Constants.animateDuration, animations: {
                self.sliderStack.alpha = Constants.maxAlpha
            }) { _ in
                let buttonText = Constants.hideButtonText
                self.toggleButton.setTitle(buttonText, for: .normal)
            }
        }
    }
    
    @objc func selectColorMethod() {
        let alert = UIAlertController(title: Constants.methodSelectionButtonTitle, message: nil, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: Constants.hex, style: .default, handler: { _ in
            self.currentColorMethod = .hex
            self.showHEXInput()
        }))
        
        alert.addAction(UIAlertAction(title: Constants.colorPicker, style: .default, handler: { _ in
            self.currentColorMethod = .colorPicker
            self.showColorPicker()
        }))
        
        alert.addAction(UIAlertAction(title: Constants.randomColor, style: .default, handler: { _ in
            self.currentColorMethod = .random
            self.upgradeBackgroundColorWithCurrentMethod()
        }))
        
        alert.addAction(UIAlertAction(title: Constants.cancel, style: .cancel, handler: nil))
        
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
        let alert = UIAlertController(title: Constants.hexColorTitle, message: Constants.hexColorMessage, preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = Constants.hexColorExample
        }
        
        alert.addAction(UIAlertAction(title: Constants.cancel, style: .cancel, handler: nil))
        
        alert.addAction(UIAlertAction(title: Constants.setColor, style: .default, handler: { _ in
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
