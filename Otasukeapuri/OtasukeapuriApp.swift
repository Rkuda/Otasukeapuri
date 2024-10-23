//
//  OtasukeapuriApp.swift
//  Otasukeapuri
//
//  Created by 阿部　明莉 on 2024/09/07.
//

import SwiftUI
import SwiftData

@main
struct OtasukeapuriApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Memo.self,
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
                .environment(\.font, Font.custom("CustomFontName", size: 20))
        }
        .modelContainer(for: Memo.self)
    }
}
