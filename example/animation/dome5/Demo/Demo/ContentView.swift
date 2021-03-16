//
//  ContentView.swift
//  Demo
//
//  Created by 王楚江 on 2021/3/16.
//

import SwiftUI

struct ContentView: View {

    @State var rotation = 0.0

    var body: some View {
        Rectangle()
            .fill(Color.red)
            .frame(width: 200, height: 200)
            .rotationEffect(.degrees(rotation))
            .animation(Animation.easeInOut(duration: 3).delay(1))
            .onTapGesture {
                rotation += 360
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
