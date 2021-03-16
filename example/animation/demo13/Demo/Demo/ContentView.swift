//
//  ContentView.swift
//  Demo
//
//  Created by 王楚江 on 2021/3/16.
//

import SwiftUI

struct ContentView: View {
    @State private var isZoomed = false

    var body: some View {
        VStack {
            Button("Toggle Zoom") {
                var transaction = Transaction(animation: .linear)
                transaction.disablesAnimations = true

                withTransaction(transaction) {
                    isZoomed.toggle()
                }
            }

            Spacer()
                .frame(height: 100)

            Text("Zoom Text 1")
                .font(.title)
                .scaleEffect(isZoomed ? 3 : 1)

            Spacer()
                .frame(height: 100)

            Text("Zoom Text 2")
                .font(.title)
                .scaleEffect(isZoomed ? 3 : 1)
                .transaction { t in
                    t.animation = .none
                }
        }
        .frame(width: 360, height: 460, alignment: .center)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
