//
//  DemoApp.swift
//  Shared
//
//  Created by 王楚江 on 2021/3/22.
//

import SwiftUI

@main
struct DemoApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: TextFile()) { file in
            ContentView(document: file.$document)
        }
    }
}
