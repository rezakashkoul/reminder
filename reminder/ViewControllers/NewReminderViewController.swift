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
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBAction func saveButtonAction(_ sender: Any) {
        saveAction()
    }
    
    var reminder: Reminder?
    weak var delegate: NewReminderViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        deregisterKeyboard()
    }
}

//MARK: - Setup Functions:
extension NewReminderViewController {
    
    private func setupViews() {
        setupTextField()
        setupTextView()
        registerKeyboard()
    }
    
    private func setupTextField() {
        textField.dropShadowAndCornerRadious(.regular, shadowOpacity: 0.2)
        textField.text = reminder?.title
    }
    
    private func setupTextView() {
        textView.dropShadowAndCornerRadious(.regular, shadowOpacity: 0.2)
        textView.text = reminder?.explanation
    }
    
    private func registerKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardWillShow(notification:NSNotification) {
        guard let userInfo = notification.userInfo else { return }
        var keyboardFrame: CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)
        var contentInset: UIEdgeInsets = self.scrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height + 40
        scrollView.contentInset = contentInset
    }
    
    @objc private func keyboardWillHide(notification: NSNotification) {
        let contentInset: UIEdgeInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInset
    }
    
    private func deregisterKeyboard() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}

//MARK: - Setup Actions:
extension NewReminderViewController {
    
    private func saveAction() {
        if let title = textField.text, !title.isEmpty, let explanation = textView.text, !explanation.isEmpty {
            setReminder(title: title, explanation: explanation)
        }
    }
    
    private func setReminder(title: String, explanation: String) {
        if let reminder = reminder {
            delegate?.updateTableView(Reminder(id: reminder.id,date: Date(), title: title, explanation: explanation))
        } else {
            delegate?.updateTableView(Reminder(id: UUID(),date: Date(), title: title, explanation: explanation))
        }
        dismiss(animated: true)
    }
}
