//
//  Extensions.swift
//  Su Takibi
//
//  Created by Talha VAROL on 09/03/22.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        } set {
            layer.cornerRadius = newValue
        }
    }
}

