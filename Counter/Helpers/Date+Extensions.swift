//
//  Date+Extensions.swift
//  Counter
//
//  Created by Ranis Galiev on 08.11.2025.
//

import Foundation

extension Date {
    var dateTimeString: String { DateFormatter.defaultDateTime.string(from: self) }
}

private extension DateFormatter {
    static let defaultDateTime: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.YY HH:mm:ss"
        return dateFormatter
    }()
}

