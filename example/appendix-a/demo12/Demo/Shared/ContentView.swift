//
//  ContentView.swift
//  Shared
//
//  Created by 王楚江 on 2021/3/23.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("username") var username: String = "Anonymous"
//    @AppStorage("username", store: UserDefaults(suiteName: "group.com.hackingwithswift.unwrap")) var username: String = "Anonymous"

    var body: some View {
        VStack {
            Text("Welcome, \(username)!")

            Button("Log in") {
//              UserDefaults.standard.set("@twostraws", forKey: "username")
                username = "@twostraws"
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
