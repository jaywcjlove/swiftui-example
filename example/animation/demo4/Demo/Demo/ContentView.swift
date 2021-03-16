//
//  ContentView.swift
//  Demo
//
//  Created by 王楚江 on 2021/3/16.
//

import SwiftUI

struct ContentView: View {
    @State private var opacity = 1.0
    var body: some View {
        Button("Press here") {
            withAnimation {
                opacity -= 0.2
            }
        }
        .padding()
        .opacity(opacity)
        .padding(100)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
