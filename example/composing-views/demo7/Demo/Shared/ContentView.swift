//
//  ContentView.swift
//  Shared
//
//  Created by 王楚江 on 2021/3/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        (Text("Hello ") + Text(Image(systemName: "star")) + Text(" World!"))
            .foregroundColor(.blue)
            .font(.largeTitle)
        Text("Hello ") + Text(Image(systemName: "star")) + Text(" World!")
            .foregroundColor(.blue)
            .font(.largeTitle)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
