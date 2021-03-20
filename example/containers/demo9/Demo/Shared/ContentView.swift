//
//  ContentView.swift
//  Shared
//
//  Created by 王楚江 on 2021/3/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            #if !os(macOS)
            Text("Hello, World!").padding()
                .navigationTitle("SwiftUI")
                .toolbar {
                    ToolbarItem(placement: .bottomBar) {
                        Button("Press Me") {
                            print("Pressed")
                        }
                    }
                }
            #else
            Text("Hello, World!").padding()
                .navigationTitle("SwiftUI")
                .toolbar {
                    ToolbarItem(placement: .automatic) {
                        Button("Press Me") {
                            print("Pressed")
                        }
                    }
                }
            #endif
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
