//
//  Date+Extension.swift
//  WiseCurrencyConverter
//
//  Created by Roman Resenchuk on 17-08-2023.
//

import Foundation

extension Date {
    // This extension adds utility methods to Date for formatting and manipulation
    func formattedDateTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        dateFormatter.doesRelativeDateFormatting = true
        return dateFormatter.string(from: self)
    }
}
