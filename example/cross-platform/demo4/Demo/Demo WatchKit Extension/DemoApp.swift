//
//  DemoApp.swift
//  Demo WatchKit Extension
//
//  Created by 王楚江 on 2021/3/21.
//

import SwiftUI

@main
struct DemoApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
