//
//  NewReminderViewController.swift
//  reminder
//
//  Created by Reza Kashkoul on 11/10/23.
//

import UIKit

protocol NewReminderViewControllerDelegate: AnyObject {
    func updateTableView(_ reminder: Reminder)
}

class NewReminderViewController: BaseViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textView: UITextView!
    
    @IBAction func saveButtonAction(_ sender: Any) {
        saveAction()
    }
    
    var reminder: Reminder!
    weak var delegate: NewReminderViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }
    
    private func saveAction() {
        if let title = textField.text, !title.isEmpty, let explanation = textView.text, !explanation.isEmpty {
            setReminder(title: title, explanation: explanation)
        }
    }


    private func setReminder(title: String, explanation: String) {
        self.reminder = Reminder(id: reminder != nil ? self.reminder.id : UUID(),
                                 date: Date(),
                                 title: title,
                                 explanation: explanation)
        delegate?.updateTableView(reminder)
        dismiss(animated: true)
    }
}

//MARK: - Setup Functions:
extension NewReminderViewController {
    
    private func setupViews() {
        textField.dropShadowAndCornerRadious(.regular, shadowOpacity: 0.2)
        textView.dropShadowAndCornerRadious(.regular, shadowOpacity: 0.2)
        textField.text = reminder?.title
        textView.text = reminder?.explanation
    }
}

