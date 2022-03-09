//
//  ContentView.swift
//  Demo
//
//  Created by 王楚江 on 2022/3/9.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("This is regular text.")
            Text("* This is **bold** text, this is *italic* text, and this is ***bold, italic*** text.")
            Text("~~A strikethrough example~~")
            Text("`Monospaced works too`")
            Text("Visit Apple: [click here](https://apple.com)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
