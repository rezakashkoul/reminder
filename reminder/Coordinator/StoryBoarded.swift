//
//  Storyboarded.swift
//  reminder
//
//  Created by Reza Kashkoul on 11/10/23.
//

import UIKit

protocol StoryBoarded {
    static func instantiate(_ storyBoardTitle: StoryBoardTitle) -> Self
}

extension StoryBoarded where Self: UIViewController {
    
    static func instantiate(_ storyBoardTitle: StoryBoardTitle) -> Self {
        let storyboard = storyBoardTitle.instance
        let fullName = NSStringFromClass(self)
        let className = fullName.components(separatedBy: ".")[1]
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }

}

enum StoryBoardTitle: String {
    case Main
    
    fileprivate var instance: UIStoryboard {
        return UIStoryboard(name: rawValue, bundle: Bundle.main)
    }
}


