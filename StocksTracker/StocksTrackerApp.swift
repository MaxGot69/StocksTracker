//
//  StocksTrackerApp.swift
//  StocksTracker
//
//  Created by Maxim Gotovchenko on 22.07.2025.
//

import SwiftUI

@main
struct StocksTrackerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
