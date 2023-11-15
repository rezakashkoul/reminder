//
//  Reminder.swift
//  reminder
//
//  Created by Reza Kashkoul on 11/11/23.
//

import Foundation

struct Reminder: Codable {
    
    let id: UUID
    var date = Date()
    var title, explanation: String
}
