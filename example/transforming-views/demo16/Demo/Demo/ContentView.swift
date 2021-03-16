//
//  ContentView.swift
//  Demo
//
//  Created by 王楚江 on 2021/3/16.
//

import SwiftUI

struct ContentView: View {
    @State private var blurAmount: CGFloat = 6
    var body: some View {
        VStack {
            Image("dog")
                .resizable()
                .frame(width: 300, height: 300)
                .blur(radius: 20)
            Text("Welcome to my SwiftUI app")
                .blur(radius: blurAmount)
            Slider(value: $blurAmount, in: 0...10)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
