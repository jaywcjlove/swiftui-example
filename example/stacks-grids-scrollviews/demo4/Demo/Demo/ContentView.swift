//
//  ContentView.swift
//  Demo
//
//  Created by 王楚江 on 2021/3/17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("First Label")
            Spacer()
                .frame(height: 50)
            Text("Second Label")
        }
        VStack {
            Text("First Label")
            Spacer(minLength: 50)
            Text("Second Label")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
