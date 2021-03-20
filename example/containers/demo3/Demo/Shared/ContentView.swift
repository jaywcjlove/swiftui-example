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
            Text("SwiftUI")
                .navigationTitle("Welcome")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Help") {
                            print("Help tapped!")
                        }
                    }
                }
            #else
            Text("SwiftUI")
                .navigationTitle("Welcome")
                .toolbar {
                    ToolbarItem(placement: .navigation) {
                        Button("About") {
                            print("About tapped!")
                        }

                        Button("Help") {
                            print("Help tapped!")
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
