//
//  UserDefaultsExtensions.swift
//  reminder
//
//  Created by Reza Kashkoul on 11/15/23.
//

import Foundation

extension UserDefaults {
    
    func save(_ reminders: [Reminder]) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(reminders) {
            self.set(encoded, forKey: "reminders")
        }
    }
    
    func retrieve() -> [Reminder] {
        if let data = self.data(forKey: "reminders") {
            let decoder = JSONDecoder()
            if let objects = try? decoder.decode([Reminder].self, from: data) {
                return objects
            } else {
                print("Couldn't decode reminders")
                return []
            }
        } else {
            print("Couldn't find key")
            return []
        }
    }
}
