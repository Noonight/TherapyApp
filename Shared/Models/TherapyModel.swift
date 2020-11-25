//
//  TherapyModel.swift
//  TherapyApp
//
//  Created by Aiur on 25.11.2020.
//

import Foundation
import SwiftUI

struct TherapyModel: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    /// Зачем? / Против чего? / Показания? / Симптомы?
    let why: String
    /// Type of using: Запивать / Орошать / Пить / Мазать
    let how: HowEnum
//    let howCount: Int?
    /// Type of using: Пробуждение / Перед сном / До еды / Во время еды / После еды
    let when: WhenEnum
    /// Minutes before or after smth
    let whenTime: Int?
    /// Количество приемов в день
    let howMuchPerDay: Int
    /// Date when you start your therapy
    let startDate: Date
    /// days, weeks, months - prefer days
    let howLong: Int
    let actualStartingDate: Date
    let showNotification: Bool
    /// all therapies
    var log: [TherapyLogModel]
    
    let binding: Binding<Bool> = Binding<Bool>.constant(true)
    
    var currentAmount: Int {
        get {
            return log.count
        }
    }
    
    var nearestTime: String {
        get {
            let tmpLog = log
            let firstSortedLog: [TherapyLogModel] = tmpLog.sorted { (l1: TherapyLogModel, l2: TherapyLogModel) -> Bool in
                l1.time > l2.time
            }
            let formatted = firstSortedLog.first
            return (formatted?.formattedTime) ?? "NO"
        }
    }
}

struct TherapyLogModel: Identifiable {
    let id = UUID()
    let time: Date
    
    var formattedTime: String {
        get {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm"
            return dateFormatter.string(from: time)
        }
    }
}

enum BaseCapacityOrAmount {
    case milliliters(Int)
    case amount(Int)
    case cups(Int)
}

enum HowEnum {
    
    case drink(BaseCapacityOrAmount) // if drink ml or smth
    case pills(BaseCapacityOrAmount) // if pills, how much
    /// Полоскать
    case rinse(BaseCapacityOrAmount) // how much too
    case irrigate(BaseCapacityOrAmount)
    
    func getString() -> String {
        switch self {
        case .drink(.milliliters(let capacity)):
            return "Drink \(capacity)ML"
        case .drink(.cups(let cups)):
            return "Drink \(cups) cups"
        case .pills(.amount(let amount)):
            return "Take \(amount) pills"
        case .rinse(.milliliters(let capacity)):
            return "Rinse with \(capacity)ML"
        case .rinse(.cups(let cups)):
            return "Rinse with \(cups) cups"
        case .irrigate(.amount(let amount)):
            return "Irrigate \(amount) times"
        default:
            return "Smth not correct"
        }
    }
    
}

enum WhenEnum: String {
    case wakeUp = "Wake up"
    case bedTime = "BedTime"
    case beforeFood = "Before food"
    case duringFood = "During food"
    case afterFood = "After food"
    case duringDay = "During day"
}
