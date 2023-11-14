//
//  TableViewCell.swift
//  reminder
//
//  Created by Reza Kashkoul on 11/10/23.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var explanationLabel: UILabel!
    
    private var reminder: Reminder!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        parentView.dropShadowAndCornerRadious(.large, shadowOpacity: 0.2)
    }
    
    func setup(with reminder: Reminder) {
        self.reminder = reminder
        setupViews()
    }
}

//MARK: - Setup Functions:
extension TableViewCell {
    
    private func setupViews() {
        selectionStyle = .none
        setupLabels()
    }
    
    private func setupLabels() {
        let date = reminder.date
        dateLabel.text = date.getPrettyDate() + " - " + date.getPrettyTime()
        titleLabel.text = reminder.title
        explanationLabel.text = reminder.explanation
    }
}
