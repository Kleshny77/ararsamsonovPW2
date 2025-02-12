//
//  Constants.swift
//  ararsamsonovPW3
//
//  Created by Артём on 08.11.2024.
//

import UIKit

// MARK: - General Constants
enum Constants {
    // MARK: - Button Styles
    static let buttonBorderWidth: CGFloat = 1
    static let backgroundColorText: UIColor = .white
    static let tintColorText: UIColor = .black
    static let cornerRadius: CGFloat = 10
    static let borderWidth: CGFloat = 2
    
    // MARK: - Layout Spacing
    static let methodSelectionButtonTop: CGFloat = 10
    static let toggleButtonTop: CGFloat = 10
    static let descriptionTop: CGFloat = 5
    
    // MARK: - Stack Properties
    static let stackRadius: CGFloat = 10
    static let stackBorderWidth: CGFloat = 1
    static let stackBottom: CGFloat = 10
    static let stackLeading: CGFloat = 20

    // MARK: - WishButtonUI
    static let buttonHeight: CGFloat = 40
    static let buttonBottom: CGFloat = 40
    static let buttonSide: CGFloat = stackLeading
    static let buttonText: String = "add wish"
    static let buttonRadius: CGFloat = stackRadius
    
    // MARK: - View Properties
    static let viewBackgroundColor: UIColor = .black
    static let maxAlpha: CGFloat = 1
    static let minAlpha: CGFloat = 0
    
    // MARK: - Title and Description Properties
    static let titleFontSize: CGFloat = 32
    static let descriptionFontSize: CGFloat = 24
    static let titleText: String = "Wish Maker"
    static let descriptionText: String = "This is a wish maker app"
    
    static let titleLabelWidthAnchor: CGFloat = 200
    static let titleLabelHeightAnchor: CGFloat = 40
    static let descriptionLableWidthAnchor: CGFloat = 280
    static let descriptionLableHeightAnchor: CGFloat = 35
    
    // MARK: - Button Layout Properties
    static let toggleButtonWidthAnchor: CGFloat = 120
    static let toggleButtonHeightAnchor: CGFloat = 30
    static let methodSelectionButtonWidthAnchor: CGFloat = 160
    static let methodSelectionButtonHeightAnchor: CGFloat = 30
    
    // MARK: - Button Titles
    static let toggleButtonText: String = "Toggle Sliders"
    static let hideButtonText: String = "Hide Sliders"
    static let showButtonText: String = "Show Sliders"
    static let methodSelectionButtonTitle: String = "Select Color Method"
    
    // MARK: - Color Picker Options
    static let hex: String = "HEX"
    static let colorPicker: String = "Color Picker"
    static let randomColor: String = "Random Color"
    static let cancel: String = "Cancel"
    static let hexColorExample: String = "#3498db"
    static let hexColorMessage: String = "Enter the color in HEX format (e.g., #RRGGBB)"
    static let hexColorMessage2: String = "Enter a hex color code:"
    static let hexColorTitle: String = "Enter HEX Color"
    static let setColor: String = "Set Color"
    
    // MARK: - Color Names
    static let red: String = "Red"
    static let blue: String = "Blue"
    static let green: String = "Green"
    
    // MARK: - UIColor Range
    static let minValueUIColor: CGFloat = 0
    static let maxValueUIColor: CGFloat = 1
    
    // MARK: - Animation
    static let animateDuration: TimeInterval = 0.3
    
    // MARK: - UIColorHex Parsing
    static let prefix: String = "#"
    static let minRgb: UInt64 = 0
    static let shiftRed: UInt64 = 16
    static let shiftGreen: UInt64 = 8
    static let mask: UInt64 = 0xFF
    static let divisor: CGFloat = 255.0
    
    // MARK: - Custom Slider
    static let sliderTextSize: Double = 20
    static let sliderMin: Double = 0
    static let sliderMax: Double = 1
    static let format: String = "%.2f"
    static let backgroundColorSlider: UIColor = .white
    
    // MARK: - Custom Slider Layout
    static let titleViewTop: CGFloat = 10
    static let titleViewLeading: CGFloat = 20
    static let sliderBottom: CGFloat = 3
    static let sliderLeading: CGFloat = 20
    static let sliderTrailing: CGFloat = 20
    static let valueLabelTop: CGFloat = 10
    static let valueLabelLeading: CGFloat = 10
    static let valueLabelTrailing: CGFloat = 20
    
    // MARK: - Errors
    static let fatalError: String = "init(coder:) has not been implemented"
}
