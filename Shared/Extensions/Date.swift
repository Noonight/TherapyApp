//
//  Date.swift
//  TherapyApp (iOS)
//
//  Created by Aiur on 25.11.2020.
//

import Foundation

extension Date {
    func format(of format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
