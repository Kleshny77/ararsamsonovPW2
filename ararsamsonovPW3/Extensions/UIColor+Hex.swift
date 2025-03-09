//
//  UIColor+Hex.swift
//  ararsamsonovPW3
//
//  Created by Артём on 08.11.2024.
//

import UIKit

// MARK: - UIColor Extension
extension UIColor {
    // MARK: Initializers
    convenience init?(hex: String) {
        // MARK: Sanitize input
        lazy var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if hexSanitized.hasPrefix(ExtensionsConstants.prefixHex) {
            hexSanitized.remove(at: hexSanitized.startIndex)
        }
        
        // MARK: Parse hex value
        lazy var rgb: UInt64 = ExtensionsConstants.minRgb
        guard Scanner(string: hexSanitized).scanHexInt64(&rgb) else { return nil }
        
        // MARK: Extract RGB components
        let red = CGFloat((rgb >> ExtensionsConstants.shiftRed) & ExtensionsConstants.mask) / ExtensionsConstants.divisor
        let green = CGFloat((rgb >> ExtensionsConstants.shiftGreen) & ExtensionsConstants.mask) / ExtensionsConstants.divisor
        let blue = CGFloat(rgb & ExtensionsConstants.mask) / ExtensionsConstants.divisor
        
        // MARK: Initialize UIColor
        self.init(red: red, green: green, blue: blue, alpha: ExtensionsConstants.maxAlpha)
    }
}
