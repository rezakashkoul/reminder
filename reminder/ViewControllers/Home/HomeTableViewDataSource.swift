//
//  HomeTableViewDataSource.swift
//  reminder
//
//  Created by Reza Kashkoul on 11/10/23.
//

import UIKit

class HomeTableViewDataSource: NSObject, UITableViewDataSource {
    
    var reminders: [Reminder] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reminders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as! TableViewCell
        let reminder = reminders[indexPath.row]
        let config = Reminder(id: reminder.id,
                              date: reminder.date,
                              title: reminder.title,
                              explanation: reminder.explanation)
        cell.setup(with: config)
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            reminders.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .middle)
            UserDefaults.standard.save(reminders)
            reminders.isEmpty ? tableView.showEmptyMessage() : tableView.hideEmptyMessage()
        }
    }
}
