//
//  ContentView.swift
//  Shared
//
//  Created by 王楚江 on 2021/3/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "person.circle").resizable().frame(width: 50, height: 50)
            Spacer().frame(height: 50)
            Text("Paul Hudson")
        }
        .contentShape(Rectangle())
        .onTapGesture {
            print("Show details for user")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
