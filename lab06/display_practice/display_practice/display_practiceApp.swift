//
//  display_practiceApp.swift
//  display_practice
//
//  Created by TeU on 2022/5/4.
//

import SwiftUI

@main
struct display_practiceApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
