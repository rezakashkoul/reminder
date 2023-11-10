//
//  Coordinator.swift
//  reminder
//
//  Created by Reza Kashkoul on 11/10/23.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
