//
//  ContentView.swift
//  Shared
//
//  Created by 王楚江 on 2021/3/23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    @State private var scale: CGFloat = 1

    var body: some View {
        VStack {
            Spacer()

            Circle()
                .frame(width: 20, height: 20)
                .scaleEffect(scale)
                .animation(reduceMotion ? nil : .spring(response: 1, dampingFraction: 0.1))

            Spacer()

            Button("Increase Scale") {
                scale *= 1.5
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
