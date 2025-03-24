//
//  WishMakerViewController+UIText.swift
//  ararsamsonovPW3
//
//  Created by Артём on 24.03.2025.
//

import UIKit

extension WishMakerViewController: UITextFieldDelegate {
    final func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            if range.location == 0 && range.length > 0 {
                return false
            }

            let currentText = textField.text ?? ""
            let updatedText = (currentText as NSString).replacingCharacters(in: range, with: string)
            return updatedText.count <= 7
        }
}
