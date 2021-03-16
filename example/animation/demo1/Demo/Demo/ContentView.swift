//
//  ContentView.swift
//  Demo
//
//  Created by 王楚江 on 2021/3/16.
//

import SwiftUI

struct ContentView: View {
    @State private var angle: Double = 0
    @State private var borderThickness: CGFloat = 1
    @State private var scale: CGFloat = 1
    var body: some View {
        Button("Press here") {
            scale += 1
        }
        .scaleEffect(scale)
        .animation(.linear(duration: 1))
        .padding(100)
        
        Button("Press here") {
            angle += 45
            borderThickness += 1
        }
        .padding(100)
        .border(Color.red, width: borderThickness)
        .rotationEffect(.degrees(angle))
        .animation(.easeIn)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
