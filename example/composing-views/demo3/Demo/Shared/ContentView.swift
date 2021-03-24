//
//  ContentView.swift
//  Shared
//
//  Created by 王楚江 on 2021/3/24.
//

import SwiftUI

struct ContentView: View {
    let title = Text("Paul Hudson")
                    .bold()
    let subtitle = Text("Author")
                    .foregroundColor(.secondary)

    var body: some View {
        VStack {
            title
                .foregroundColor(.red)
            subtitle
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
