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

extension UITableView {
    
    func showEmptyMessage() {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        messageLabel.text = "There's nothing to show ;("
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.sizeToFit()
        self.backgroundView = messageLabel
        self.separatorStyle = .none
    }
    
    func hideEmptyMessage() {
        self.backgroundView = nil
        self.separatorStyle = .none
    }
    
    func reloadWithAnimation() {
        self.reloadData()
        let tableViewHeight = self.bounds.size.height
        let cells = self.visibleCells
        var delayCounter = 0
        for cell in cells {
            cell.transform = CGAffineTransform(translationX: 0, y: tableViewHeight)
        }
        for cell in cells {
            UIView.animate(withDuration: 0.8, delay: 0.5 * Double(delayCounter), usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: [.curveEaseInOut, .beginFromCurrentState], animations: {
                cell.transform = CGAffineTransform.identity
            }, completion: nil)
            delayCounter += 1
        }
    }
}

extension UITableViewCell {
    
    static var identifier: String {
        return String(describing: self)
    }
    
    static func register(for tableView: UITableView)  {
        let cellName = String(describing: self)
        let cellNib = UINib(nibName: cellName, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: cellName)
    }
}
