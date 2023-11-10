//
//  HomeViewController.swift
//  reminder
//
//  Created by Reza Kashkoul on 11/10/23.
//

import UIKit

class HomeViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }

}

//MARK: - Setup Functions:
extension HomeViewController {
    
    private func setupViews() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(addButtonAction))
    }
}

//MARK: - Actions:
extension HomeViewController {
    
    @objc private func addButtonAction() {
        coordinator?.showNewReminder()
    }
}
