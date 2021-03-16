//
//  ContentView.swift
//  Demo
//
//  Created by 王楚江 on 2021/3/16.
//

import SwiftUI

struct ContentView: View {
    @State private var showingPopover = false
    var body: some View {
        VStack {
            Button("Show Menu") {
                showingPopover = true
            }
            .popover(isPresented: $showingPopover) {
                Text("Your content here")
                    .font(.headline)
                    .padding()
            }
        }
        .frame(width: 300, height: 300)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
