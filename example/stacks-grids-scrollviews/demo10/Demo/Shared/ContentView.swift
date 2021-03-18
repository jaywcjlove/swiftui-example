//
//  ContentView.swift
//  Shared
//
//  Created by 王楚江 on 2021/3/18.
//

import SwiftUI

struct ContentView: View {
    let colors: [Color] = [.red, .green, .blue]

    var body: some View {
        ScrollView {
            ScrollViewReader { value in
                Button("Jump to #8") {
                    withAnimation() {
                        value.scrollTo(8, anchor: .top)
                    }
                }
                .padding()

                ForEach(0..<100) { i in
                    Text("Example \(i)")
                        .font(.title)
                        .frame(width: 200, height: 200)
                        .background(colors[i % colors.count])
                        .id(i)
                }
            }
        }
        .frame(height: 350)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
