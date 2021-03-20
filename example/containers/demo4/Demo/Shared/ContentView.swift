//
//  ContentView.swift
//  Shared
//
//  Created by 王楚江 on 2021/3/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Text("First View")
                .padding()
                .tabItem {
                    Image(systemName: "1.circle")
                    Text("First")
                }
                .tag(1)
            Text("Second View")
                .padding()
                .tabItem {
                    Image(systemName: "2.circle")
                    Text("Second")
                }
                .tag(2)
            
            
            Text("First View")
                .padding()
                .tabItem {
                    Label("First", systemImage: "1.circle")
                }
                .tag(3)

            Text("Second View")
                .padding()
                .tabItem {
                    Label("Second", systemImage: "2.circle")
                }
                .tag(4)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
