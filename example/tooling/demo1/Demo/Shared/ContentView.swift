//
//  ContentView.swift
//  Shared
//
//  Created by 王楚江 on 2021/3/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .environment(\.sizeCategory, .extraSmall)
            ContentView()
            ContentView()
                .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)
        }
    }
}
