//
//  DemoApp.swift
//  Shared
//
//  Created by 王楚江 on 2021/3/21.
//

import SwiftUI

@main
struct DemoApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
