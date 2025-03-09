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
        let redColor = CGFloat(red)
        let greenColor = CGFloat(green)
        let blueColor = CGFloat(blue)
        self.view.backgroundColor = UIColor(red: redColor, green: greenColor, blue: blueColor, alpha: WishMakerConstants.maxAlpha)
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
    func colorPickerViewControllerDidSelectColor(_ colorPicker: UIColorPickerViewController) {
        self.view.backgroundColor = colorPicker.selectedColor
    }
    
    enum ColorMethod {
        case hex, colorPicker, random
    }
}
