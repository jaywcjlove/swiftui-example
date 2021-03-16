//
//  ContentView.swift
//  Demo
//
//  Created by 王楚江 on 2021/3/16.
//

import SwiftUI

struct ContentView: View {
    @State private var rotation = 0.0
    var body: some View {
        VStack {
            Slider(value: $rotation, in: 0...360)

            Text("Up we go")
                .rotationEffect(.degrees(rotation), anchor: .topLeading)
        }
        .padding()
        .frame(width: 200, height: 200, alignment: .center)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
