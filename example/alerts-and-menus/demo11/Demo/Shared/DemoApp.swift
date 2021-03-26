//
//  DemoApp.swift
//  Shared
//
//  Created by 王楚江 on 2021/3/27.
//

import SwiftUI

@main
struct DemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        #if os(macOS)
        Settings {
            SettingsView()
        }
        #endif
    }
}
