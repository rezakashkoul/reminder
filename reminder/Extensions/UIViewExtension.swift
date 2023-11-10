//
//  UIViewExtension.swift
//  reminder
//
//  Created by Reza Kashkoul on 11/10/23.
//

import Foundation
import UIKit

extension UIView {
    
    enum CornerRadius: CGFloat {
        case none = 0
        case large = 15
        case regular = 10
        case small = 5
        case round = -1
        case superLarge = 25
        case massiveLarge = 60
    }
    
    func dropShadowAndCornerRadious(_ value: CornerRadius, shadowOpacity: Float = 0.05) {
        roundUp(value)
        dropNormalShadow(opacity: shadowOpacity)
    }
    
    func roundUp(_ value: CornerRadius) {
        DispatchQueue.main.async { [weak self] in
            if value == .round {
                self?.layer.cornerRadius = (self?.bounds.height ?? 2) / 2
            } else {
                self?.layer.cornerRadius = value.rawValue
            }
            self?.layer.masksToBounds = true
        }
    }
    
    func roundUp(_ value: CGFloat) {
        DispatchQueue.main.async { [weak self] in
            self?.layer.cornerRadius = value
            self?.layer.masksToBounds = true
        }
    }
    
    func dropNormalShadow(opacity:Float = 0.05) {
        DispatchQueue.main.async { [weak self] in
            self?.layer.masksToBounds = false
            self?.layer.shadowColor = UIColor.black.cgColor
            self?.layer.shadowOpacity = opacity
            self?.layer.shadowOffset = CGSize(width: 0, height: 0)
            self?.layer.shadowRadius = 8
        }
    }
}
