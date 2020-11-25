//
//  TestData.swift
//  TherapyApp (iOS)
//
//  Created by Aiur on 25.11.2020.
//

import Foundation

let testData = [
    TherapyModel(name: "Лизобакт",
                 description: "Таблетка для рассасывания",
                 why: "Инфекционно-воспалительное заболевание слизистой оболочки полости рта, десен, гортани",
                 how: HowEnum.pills(.amount(1)),
                 when: .duringDay,
                 whenTime: nil,
                 howMuchPerDay: 6,
                 startDate: Date(),
                 howLong: 10,
                 actualStartingDate: Date(),
                 showNotification: true,
                 log: [
                    TherapyLogModel(time: Date()),
                    TherapyLogModel(time: Date()),
                    TherapyLogModel(time: Date()),
                    TherapyLogModel(time: Date())
                 ]),
    TherapyModel(name: "Tantum-Verde",
                 description: "Спрей",
                 why: "Восполительное заболевание полости рта и ЛОР органов",
                 how: HowEnum.irrigate(.amount(2)),
                 when: .duringDay,
                 whenTime: nil,
                 howMuchPerDay: 5,
                 startDate: Date(),
                 howLong: 7,
                 actualStartingDate: Date(),
                 showNotification: true,
                 log: [
                    TherapyLogModel(time: Date()),
                    TherapyLogModel(time: Date()),
                    TherapyLogModel(time: Date())
                 ]),
    TherapyModel(name: "Линекс",
                 description: "Капсула",
                 why: "Лечение и профилактика дисбактериозов. Возможная причина неприятного запаха изо рта.",
                 how: HowEnum.pills(.amount(1)),
                 when: .afterFood,
                 whenTime: 5,
                 howMuchPerDay: 3,
                 startDate: Date(),
                 howLong: 14,
                 actualStartingDate: Date(),
                 showNotification: true,
                 log: [
                    TherapyLogModel(time: Date())
                 ])
]
