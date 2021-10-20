//
//  ContentView.swift
//  Demo WatchKit Extension
//
//  Created by 王楚江 on 2021/10/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List(1..<51) {
            Text("\($0)")
        }
        .listStyle(.carousel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
