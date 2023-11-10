//
//  HomeTableViewDataSource.swift
//  reminder
//
//  Created by Reza Kashkoul on 11/10/23.
//

import UIKit

class HomeTableViewDataSource: NSObject, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as! TableViewCell
        let config = TableViewCell.Config(date: "Date", title: "String", explanation: "String")
        cell.setup(with: config)
        return cell
    }
    

}
