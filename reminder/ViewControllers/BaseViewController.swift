//
//  BaseViewController.swift
//  reminder
//
//  Created by Reza Kashkoul on 11/10/23.
//

import UIKit

class BaseViewController: UIViewController, StoryBoarded {

    weak var coordinator: MainCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }

}

//MARK: - Setup Functions:
extension BaseViewController {
    
    private func setupViews() {
        view.backgroundColor = .brown
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
