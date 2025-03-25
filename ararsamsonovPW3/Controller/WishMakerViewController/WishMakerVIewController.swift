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
    lazy var colors: UIColor = WishMakerConstants.viewBackgroundColor {
        didSet {
            self.view.backgroundColor = colors
            updateButtonTitleColors(with: colors)
        }
    }
    
    let titleLabel = UILabel()
    let descriptionLabel = UILabel()
    let toggleButton = UIButton(type: .system)
    let methodSelectionButton = UIButton(type: .system)
    let addWishButton: UIButton = UIButton(type: .system)
    let scheduleWishesButton: UIButton = UIButton(type: .system)
    let sliderStack = UIStackView()
    let actionStack = UIStackView()
       
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
        configureActionStack()
        self.colors = WishMakerConstants.viewBackgroundColor
    }
    
    private final func updateButtonTitleColors(with color: UIColor) {
        let buttons: [UIButton] = [
            toggleButton,
            methodSelectionButton,
            addWishButton,
            scheduleWishesButton
        ]
        
        buttons.forEach { button in
            button.setTitleColor(color, for: .normal)
        }
    }
    
    // MARK: - Color Management Methods
    private final func upgradeBackgroundColorWithCurrentMethod() {
        switch currentColorMethod {
        case .hex:
            self.showHEXInput()
        case .colorPicker:
            self.showColorPicker()
        case .random:
            self.colors = getUniqueColors()
        }
    }
    
    private final func showHEXInput() {
        let alert = UIAlertController(
            title: WishMakerConstants.hexColorTitle,
            message: WishMakerConstants.hexColorMessage,
            preferredStyle: .alert
        )

        alert.addTextField { [weak self] textField in
            textField.text = "#"
            textField.clearButtonMode = .whileEditing
            textField.autocorrectionType = .no
            textField.autocapitalizationType = .none
            textField.keyboardType = .asciiCapable
            textField.delegate = self

            NotificationCenter.default.addObserver(forName: UITextField.textDidChangeNotification, object: textField, queue: .main) { _ in
                guard let text = textField.text else { return }

                if !text.hasPrefix("#") {
                    textField.text = "#" + text.replacingOccurrences(of: "#", with: "")
                }

                if textField.text!.count > 7 {
                    textField.text = String(textField.text!.prefix(7))
                }

                if let hex = textField.text, let previewColor = UIColor(hex: hex) {
                    alert.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = previewColor
                }
            }
        }

        alert.addAction(UIAlertAction(title: WishMakerConstants.cancel, style: .cancel, handler: nil))

        alert.addAction(UIAlertAction(title: WishMakerConstants.setColor, style: .default, handler: { _ in
            if let hex = alert.textFields?.first?.text, let color = UIColor(hex: hex) {
                self.colors = color
            }
        }))

        present(alert, animated: true)
    }
    
    // MARK: - Color Picker
    private final func showColorPicker() {
        let colorPicker = UIColorPickerViewController()
        colorPicker.delegate = self
        colorPicker.selectedColor = self.view.backgroundColor ?? .white
        present(colorPicker, animated: true)
    }
    
    // MARK: - Action Methods
    @objc
    final func toggleSliderStackVisibility() {
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
    
    @objc
    final func selectColorMethod() {
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
    
    @objc
    final func addWishButtonPressed() {
        let vc = WishStoringViewController()
        vc.backgroundColor = self.colors
        present(vc, animated: true)
    }
    
    @objc
    final func scheduleWishesButtonPressed() {
        let vc = WishCalendarViewController()
        vc.backgroundColor = self.colors
        navigationController?.pushViewController(vc, animated: true)
    }
}
