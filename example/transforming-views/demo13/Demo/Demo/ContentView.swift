//
//  ContentView.swift
//  Demo
//
//  Created by 王楚江 on 2021/3/16.
//

import SwiftUI

struct ContentView: View {
    @State private var opacity = 0.5
    var body: some View {
        VStack {
            Text("Now you see me")
                .padding()
                .background(Color.red)
                .opacity(opacity)

            Slider(value: $opacity, in: 0...1)
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
