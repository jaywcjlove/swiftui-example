//
//  ContentView.swift
//  Demo
//
//  Created by 王楚江 on 2021/3/16.
//

import SwiftUI

struct ContentView: View {
    @State private var phase: CGFloat = 0
    var body: some View {
        Rectangle()
            .strokeBorder(style: StrokeStyle(lineWidth: 4, dash: [10], dashPhase: phase))
            .frame(width: 200, height: 200)
            .onAppear {
                withAnimation(Animation.linear.repeatForever(autoreverses: false)) {
                    phase -= 20
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
