//
//  ping_pong_scoreApp.swift
//  ping pong score
//
//  Created by Ricardo Arana Reyes Guerrero on 3/10/24.
//

import SwiftUI
import SwiftData

@main
struct ping_pong_scoreApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
