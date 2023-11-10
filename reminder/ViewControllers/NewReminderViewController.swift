//
//  NewReminderViewController.swift
//  reminder
//
//  Created by Reza Kashkoul on 11/10/23.
//

import UIKit

class NewReminderViewController: BaseViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }

}

//MARK: - Setup Functions:
extension NewReminderViewController {
    
    private func setupViews() {
        view.backgroundColor = .white
        textField.dropShadowAndCornerRadious(.regular, shadowOpacity: 0.2)
        textView.dropShadowAndCornerRadious(.regular, shadowOpacity: 0.2)
    }
}

