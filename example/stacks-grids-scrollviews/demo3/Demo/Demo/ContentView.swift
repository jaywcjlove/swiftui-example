//
//  ContentView.swift
//  Demo
//
//  Created by 王楚江 on 2021/3/17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            Text("Hello")
            Spacer()
            Text("World")
        }
        VStack {
            Spacer()
            Text("Hello World")
            Spacer()
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
