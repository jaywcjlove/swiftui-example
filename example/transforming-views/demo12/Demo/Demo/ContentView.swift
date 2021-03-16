//
//  ContentView.swift
//  Demo
//
//  Created by 王楚江 on 2021/3/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Round Me")
            .padding()
            .background(Color.red)
            .cornerRadius(25)
        Text("Round Me")
            .padding()
            .background(Color.red)
            .clipShape(Capsule())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
