//
//  ContentView.swift
//  Shared
//
//  Created by 王楚江 on 2021/3/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Button("Tap Me") {
                print("Button was tapped")
            }
            .frame(width: 100, height: 100)
            .background(Color.white)

            Rectangle()
                .fill(Color.red.opacity(0.2))
                .frame(width: 300, height: 300)
                .clipShape(Circle())
                .allowsHitTesting(false)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
