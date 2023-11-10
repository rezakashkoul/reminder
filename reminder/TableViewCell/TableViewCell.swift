//
//  TableViewCell.swift
//  reminder
//
//  Created by Reza Kashkoul on 11/10/23.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var explanationLabel: UILabel!
    
    private var config: TableViewCell.Config!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(with config: Config) {
        self.config = config
        setupViews()
    }
}

//MARK: - Setup Functions:
extension TableViewCell {
    
    private func setupViews() {
        dateLabel.text = config.date
        titleLabel.text = config.title
        explanationLabel.text = config.explanation
    }
}

//MARK: - Configuration:
extension TableViewCell {
    
    struct Config {
        var date, title, explanation: String
    }
}
