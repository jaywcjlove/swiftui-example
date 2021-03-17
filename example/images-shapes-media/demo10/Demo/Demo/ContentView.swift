//
//  ContentView.swift
//  Demo
//
//  Created by 王楚江 on 2021/3/17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            ContainerRelativeShape()
                .inset(by: 8)
                .fill(Color.blue)

            Text("Hello, World!")
                .font(.title)
        }
        .frame(width: 300, height: 200)
        .background(Color.red)
        .clipShape(Capsule())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
