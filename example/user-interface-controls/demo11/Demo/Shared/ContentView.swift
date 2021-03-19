//
//  ContentView.swift
//  Shared
//
//  Created by 王楚江 on 2021/3/19.
//

import SwiftUI

struct ContentView: View {
    @State private var showGreeting = true

    var body: some View {
        VStack {
            Toggle("Show welcome message", isOn: $showGreeting)
                .toggleStyle(SwitchToggleStyle(tint: .red))
            
            Toggle("Show welcome message", isOn: $showGreeting)
                .toggleStyle(CheckboxToggleStyle())
            
            if showGreeting {
                Text("Hello World!")
            }
        }
        .frame(width: 380, height: 300, alignment: .center)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
