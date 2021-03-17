//
//  ContentView.swift
//  Demo
//
//  Created by 王楚江 on 2021/3/17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("SwiftUI")
                .padding()
            Text("rocks")
            Text("SwiftUI")
                .padding(.bottom)
            Text("SwiftUI")
                .padding(100)
            Text("SwiftUI")
                .padding(.bottom, 100)
        }
        .frame(width: 300, height: 650, alignment: .center)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
