//
//  TherapyAppApp.swift
//  Shared
//
//  Created by Aiur on 23.11.2020.
//

import SwiftUI

@main
struct TherapyAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
