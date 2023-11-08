//
//  SwiftUiMarvelApp.swift
//  SwiftUiMarvel
//
//  Created by Marcos on 8/11/23.
//

import SwiftUI

@main
struct SwiftUiMarvelApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
