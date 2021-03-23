//
//  ContentView.swift
//  Shared
//
//  Created by 王楚江 on 2021/3/24.
//

import SwiftUI

struct ContentView: View {
    @SceneStorage("text") var text = ""

    var body: some View {
        #if os(iOS)
        NavigationView {
            TextEditor(text: $text)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        #else
        NavigationView {
            TextEditor(text: $text)
        }
        #endif
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
