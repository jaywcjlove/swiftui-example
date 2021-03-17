//
//  ContentView.swift
//  Demo
//
//  Created by 王楚江 on 2021/3/17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 50) {
            Text("SwiftUI")
            Text("rocks")
        }
        VStack {
            Text("SwiftUI")
            Divider()
            Text("rocks")
        }
        VStack(alignment: .leading) {
            Text("SwiftUI")
            Text("rocks")
        }
        VStack(alignment: .leading, spacing: 20) {
            Text("SwiftUI")
            Text("rocks")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
