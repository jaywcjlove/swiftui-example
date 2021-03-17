//
//  ContentView.swift
//  Demo
//
//  Created by 王楚江 on 2021/3/17.
//

import SwiftUI

struct SimpleGameResult {
    let id = UUID()
    let score: Int
}

struct ContentView: View {
    let colors: [Color] = [.red, .green, .blue]
    let results = [
        SimpleGameResult(score: 8),
        SimpleGameResult(score: 5),
        SimpleGameResult(score: 10)
    ]
    var body: some View {
        VStack(alignment: .leading) {
            ForEach((1...10).reversed(), id: \.self) {
                Text("\($0)…")
            }

            Text("Ready or not, here I come!")
            
            ForEach(colors, id: \.self) { color in
                Text(color.description.capitalized)
                    .padding()
                    .background(color)
            }
            
            ForEach(results, id: \.id) { result in
                Text("Result: \(result.score)")
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
