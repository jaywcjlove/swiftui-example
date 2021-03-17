//
//  ContentView.swift
//  Demo
//
//  Created by 王楚江 on 2021/3/17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Circle()
            .strokeBorder(Color.black, lineWidth: 20)
            .background(Circle().fill(Color.blue))
            .frame(width: 150, height: 150)
        ZStack {
            Circle()
                .fill(Color.red)

            Circle()
                .strokeBorder(Color.black, lineWidth: 20)
        }
        .frame(width: 150, height: 150)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
