//
//  HomeViewController.swift
//  reminder
//
//  Created by Reza Kashkoul on 11/10/23.
//

import UIKit

class HomeViewController: BaseViewController, UITableViewDelegate, NewReminderViewControllerDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var dataSource = HomeTableViewDataSource() {
        didSet {
            setupTableViewContainerMessage()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}

//MARK: - Setup Functions:
extension HomeViewController {
    
    private func setupViews() {
        navigationItem.title = "Reminder" 
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonAction))
        setupTableView()
    }
    
    private func setupTableView() {
        TableViewCell.register(for: tableView)
        tableView.delegate = self
        tableView.dataSource = dataSource
        tableView.separatorStyle = .none
        setupTableViewContainerMessage()
    }
    
    private func setupTableViewContainerMessage() {
        dataSource.reminders.isEmpty ? tableView.showEmptyMessage() : tableView.hideEmptyMessage()
    }
}

//MARK: - SetupTableViewDelegate:
extension HomeViewController {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var reminder = dataSource.reminders[indexPath.row]
        reminder.date = Date()
        coordinator?.showNewReminder(reminder: reminder, delegate: self)
    }
}
    

//MARK: - Actions:
extension HomeViewController {
    
    @objc private func addButtonAction() {
        coordinator?.showNewReminder(reminder: nil, delegate: self)
    }
    
    func updateTableView(_ reminder: Reminder) {
        if !dataSource.reminders.filter({$0.id == reminder.id}).isEmpty {
            for i in 0...dataSource.reminders.count - 1 {
                if dataSource.reminders[i].id == reminder.id {
                    dataSource.reminders[i] = reminder
                    break
                }
            }
        } else {
            dataSource.reminders.append(reminder)
        }
        dataSource.reminders = dataSource.reminders.sorted(by: {$0.date > $1.date})
        DispatchQueue.main.async { [self] in
            setupTableViewContainerMessage()
            tableView.reloadData()
        }
    }
}
