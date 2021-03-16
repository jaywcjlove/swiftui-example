//
//  ContentView.swift
//  Demo
//
//  Created by 王楚江 on 2021/3/16.
//

import SwiftUI

struct ContentView: View {
    @State private var showingWelcome = false
    var body: some View {
        VStack {
            Toggle("Toggle label", isOn: $showingWelcome.animation())

            if showingWelcome {
                Text("Hello World")
            }
        }
        .padding(100)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
