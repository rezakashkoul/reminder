//
//  HomeViewController.swift
//  reminder
//
//  Created by Reza Kashkoul on 11/10/23.
//

import UIKit

class HomeViewController: BaseViewController, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let dataSource = HomeTableViewDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataSource
        setupViews()
    }
}

//MARK: - Setup Functions:
extension HomeViewController {
    
    private func setupViews() {
        navigationItem.title = "Reminder" 
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonAction))
        TableViewCell.register(for: tableView)
    }
}

//MARK: - Actions:
extension HomeViewController {
    
    @objc private func addButtonAction() {
        coordinator?.showNewReminder()
    }
}
