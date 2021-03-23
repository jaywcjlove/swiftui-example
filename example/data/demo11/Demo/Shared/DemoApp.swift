//
//  DemoApp.swift
//  Shared
//
//  Created by 王楚江 on 2021/3/23.
//

import SwiftUI
import CoreSpotlight

@main
struct DemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onContinueUserActivity(CSSearchableItemActionType, perform: handleSpotlight)
        }
    }
    func handleSpotlight(_ userActivity: NSUserActivity) {
        if let id = userActivity.userInfo?[CSSearchableItemActivityIdentifier] as? String {
            print("--> Found identifier \(id)")
        }
    }
}
