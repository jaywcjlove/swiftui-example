//
//  ContentView.swift
//  Shared
//
//  Created by 王楚江 on 2021/3/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            #if !os(macOS)
            Text("SwiftUI")
                .navigationTitle("Welcome")
                .navigationBarTitleDisplayMode(.inline)
            #else
            Text("SwiftUI")
                .navigationTitle("Welcome")
            #endif
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
