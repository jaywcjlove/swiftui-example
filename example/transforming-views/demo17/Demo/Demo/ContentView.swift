//
//  ContentView.swift
//  Demo
//
//  Created by 王楚江 on 2021/3/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.red)
                .frame(width: 200, height: 200)
                .offset(x: -50)
                .blendMode(.screen)

            Circle()
                .fill(Color.blue)
                .frame(width: 200, height: 200)
                .offset(x: 50)
                .blendMode(.screen)
        }
        .frame(width: 400)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
