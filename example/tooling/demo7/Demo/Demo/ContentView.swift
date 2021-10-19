//
//  ContentView.swift
//  Demo
//
//  Created by 王楚江 on 2021/10/19.
//

import SwiftUI
import MySamplePackage

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
            .onAppear(perform: {
                printLog(message: "Hi! ~~~")
            })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
