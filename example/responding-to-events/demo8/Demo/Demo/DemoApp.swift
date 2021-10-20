//
//  DemoApp.swift
//  Demo
//
//  Created by 王楚江 on 2021/10/20.
//

import SwiftUI

@main
struct DemoApp: App {
    var body: some Scene {
        WindowGroup {
            if #available(iOS 15.0, *) {
                ContentView()
            } else {
                // Fallback on earlier versions
            }
        }
    }
}
