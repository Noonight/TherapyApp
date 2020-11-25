//
//  TherapyAppApp.swift
//  TherapyApp
//
//  Created by Aiur on 23.11.2020.
//

import SwiftUI

@main
struct TherapyApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
