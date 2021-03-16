//
//  ContentView.swift
//  Demo
//
//  Created by 王楚江 on 2021/3/16.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: String? = nil
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: Text("View A"), tag: "A", selection: $selection) { EmptyView() }
                NavigationLink(destination: Text("View B"), tag: "B", selection: $selection) { EmptyView() }

                Button("Tap to show A") {
                    selection = "A"
                }

                Button("Tap to show B") {
                    selection = "B"
                }
            }
            .navigationTitle("Navigation")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
