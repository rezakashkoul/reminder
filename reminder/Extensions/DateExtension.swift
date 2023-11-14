//
//  DateExtension.swift
//  reminder
//
//  Created by Reza Kashkoul on 11/11/23.
//

import Foundation

extension Date {
    
    func getPrettyDate(format: String = "MMM d") -> String {
        let df = DateFormatter()
        df.setLocalizedDateFormatFromTemplate(format)
        return df.string(from: self)
    }
    
    func getPrettyTime() -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter.string(from: self)
    }
}
