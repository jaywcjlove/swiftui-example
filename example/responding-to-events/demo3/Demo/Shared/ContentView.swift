//
//  ContentView.swift
//  Shared
//
//  Created by 王楚江 on 2021/3/19.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("Run") {
                print("Running…")
            }
            .keyboardShortcut("r", modifiers: .shift)

            Button("Home") {
                print("Going home")
            }
            .keyboardShortcut("h", modifiers: [.control, .option, .command])
            
            Button("Confirm Launch") {
                print("Launching drone…")
            }
            .keyboardShortcut(.defaultAction)
        }
        .frame(width: 380, height: 360, alignment: .center)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
