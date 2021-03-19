//
//  DemoApp.swift
//  Shared
//
//  Created by 王楚江 on 2021/3/19.
//

import SwiftUI

@main

struct DemoApp: App {
    
    struct HomeView: View {
        var body: some View {
            Text("Home!")
                .padding()
        }
    }

    struct ContactsView: View {
        var body: some View {
            Text("Contacts!")
                .padding()
        }
    }

    struct LocationView: View {
        var body: some View {
            Text("Location!")
                .padding()
        }
    }

    struct AccountView: View {
        var body: some View {
            Text("Account!")
                .padding()
        }
    }
    var body: some Scene {
        WindowGroup {
            TabView {
                HomeView()
                ContactsView()
                LocationView()
                AccountView()
            }
        }
    }
}
