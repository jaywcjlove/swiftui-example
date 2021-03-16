//
//  ContentView.swift
//  Demo
//
//  Created by 王楚江 on 2021/3/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Up we go")
            .scaleEffect(5)
            .frame(width: 300, height: 300)
        Text("Up we go")
            .scaleEffect(2, anchor: .bottomTrailing)
            .frame(width: 300, height: 300)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
