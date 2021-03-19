//
//  DemoApp.swift
//  Demo
//
//  Created by 王楚江 on 2021/3/19.
//

import SwiftUI

@main
struct DemoApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
