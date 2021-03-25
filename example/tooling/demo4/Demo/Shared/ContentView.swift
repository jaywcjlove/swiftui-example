//
//  ContentView.swift
//  Shared
//
//  Created by 王楚江 on 2021/3/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello World")
            .navigationTitle("Welcome")
            .frame(width: 300, height: 500, alignment: .center)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
    }
}
