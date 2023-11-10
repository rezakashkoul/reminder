//
//  Storyboarded.swift
//  reminder
//
//  Created by Reza Kashkoul on 11/10/23.
//

import UIKit

enum StoryBoardTitle: String {
    case main
    
    fileprivate var instance: UIStoryboard {
        return UIStoryboard(name: rawValue, bundle: Bundle.main)
    }
}

protocol StoryBoarded {
    static func instantiate(_ storyBoardTitle: StoryBoardTitle) -> Self
}

extension StoryBoarded where Self: UIViewController {
    
    static func instantiate(_ storyBoardTitle: StoryBoardTitle) -> Self {
        let storyboard = storyBoardTitle.instance
        let viewController = storyboard.instantiateViewController(withIdentifier: self.identifier) as! Self
        return viewController
    }
}

extension UIViewController {
    
    static var identifier: String {
        return String(describing: self)
    }
}



