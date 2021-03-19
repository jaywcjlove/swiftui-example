//
//  ContentView.swift
//  Shared
//
//  Created by 王楚江 on 2021/3/19.
//

import SwiftUI

struct ContentView: View {
    @State private var profileText: String = "Enter your bio"

    var body: some View {
        TextEditor(text: $profileText)
            .foregroundColor(.secondary)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
