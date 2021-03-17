//
//  ContentView.swift
//  Demo
//
//  Created by 王楚江 on 2021/3/17.
//

import SwiftUI

struct ContentView: View {
    var tossResult: some View {
        if Bool.random() {
            return AnyView(Image("laser-show").resizable().scaledToFit())
        } else {
            return AnyView(Text("Better luck next time").font(.title))
        }
    }

    var body: some View {
        VStack {
            Text("Coin Flip")
                .font(.largeTitle)

            tossResult
                .frame(width: 400, height: 300)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
