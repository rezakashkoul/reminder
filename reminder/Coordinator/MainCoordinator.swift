//
//  MainCoordinator.swift
//  reminder
//
//  Created by Reza Kashkoul on 11/10/23.
//

import Foundation
import UIKit

class MainCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = HomeViewController.instantiate(.Main)
        navigationController.delegate = self
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func showNewReminder() {
        let vc = NewReminderViewController.instantiate(.Main)
        vc.coordinator = self        
        navigationController.present(vc, animated: true)
    }
//    
//    func showBuyViewController() {
//        let child = BuyCoordinator(navigationController: navigationController)
//        childCoordinators.append(child)
//        child.start()
//    }

}

////MARK: - Navigation Functions
//extension MainCoordinator {
//    
//    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
//        // Read the view controller we’re moving from.
//        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else { return }
//        
//        // Check whether our view controller array already contains that view controller. If it does it means we’re pushing a different view controller on top rather than popping it, so exit.
//        if navigationController.viewControllers.contains(fromViewController) { return }
//        
//        // We’re still here – it means we’re popping the view controller, so we can check whether it’s a buy view controller
//        if let buyViewController = fromViewController as? BuyViewController {
//            // We're popping a buy view controller; end its coordinator
//            childDidFinish(buyViewController.coordinator)
//        }
//    }
//    
//    func childDidFinish(_ child: Coordinator?) {
//        for (index, coordinator) in childCoordinators.enumerated() {
//            if coordinator === child {
//                childCoordinators.remove(at: index)
//                break
//            }
//        }
//    }
//}
