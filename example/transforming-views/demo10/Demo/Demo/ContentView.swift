//
//  ContentView.swift
//  Demo
//
//  Created by 王楚江 on 2021/3/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("EPISODE LLVM")
            .font(.largeTitle)
            .foregroundColor(.yellow)
            .rotation3DEffect(.degrees(45), axis: (x: 1, y: 0, z: 0))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
