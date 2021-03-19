//
//  DemoApp.swift
//  Shared
//
//  Created by 王楚江 on 2021/3/19.
//

import SwiftUI

@main
struct DemoApp: App {
    init() {
        UserDefaults.standard.register(defaults: [
            "name": "Taylor Swift",
            "highScore": 10
        ])
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
