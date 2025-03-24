//
//  ColorPickerViewController.swift
//  ararsamsonovPW3
//
//  Created by Артём on 08.11.2024.
//

import UIKit

extension WishMakerViewController: UIColorPickerViewControllerDelegate {
    // MARK: - Background Color Management
    final func upgradeBackgroundColor(red: Double, green: Double, blue: Double) {
        let color = UIColor(
            red: CGFloat(red),
            green: CGFloat(green),
            blue: CGFloat(blue),
            alpha: WishMakerConstants.maxAlpha
        )
        self.colors = color
    }
    
    final func getUniqueColors() -> UIColor {
        let color = UIColor(
            displayP3Red: .random(in: WishMakerConstants.minValueUIColor...WishMakerConstants.maxValueUIColor),
            green: .random(in: WishMakerConstants.minValueUIColor...WishMakerConstants.maxValueUIColor),
            blue: .random(in: WishMakerConstants.minValueUIColor...WishMakerConstants.maxValueUIColor),
            alpha: WishMakerConstants.maxAlpha
        )
        return color
    }
    
    // MARK: - UIColorPickerViewControllerDelegate
    final func colorPickerViewControllerDidSelectColor(_ colorPicker: UIColorPickerViewController) {
        self.colors = colorPicker.selectedColor
    }
    
    enum ColorMethod {
        case hex, colorPicker, random
    }
}
