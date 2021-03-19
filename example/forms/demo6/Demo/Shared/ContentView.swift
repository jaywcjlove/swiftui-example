//
//  ContentView.swift
//  Shared
//
//  Created by 王楚江 on 2021/3/20.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAdvancedOptions = false
    @State private var enableLogging = false

    var body: some View {
        Form {
            Section {
                Toggle("Show advanced options", isOn: $showingAdvancedOptions.animation())

                if showingAdvancedOptions {
                    Toggle("Enable logging", isOn: $enableLogging)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
