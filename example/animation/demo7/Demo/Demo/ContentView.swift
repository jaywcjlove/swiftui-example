//
//  ContentView.swift
//  Demo
//
//  Created by 王楚江 on 2021/3/16.
//

import SwiftUI

struct ContentView: View {
    @State private var isEnabled = false

    var body: some View {
        Button("Press Me") {
            isEnabled.toggle()
        }
        .foregroundColor(.white)
        .frame(width: 200, height: 200)
        .background(isEnabled ? Color.green : Color.red)
        .animation(nil)
        .clipShape(RoundedRectangle(cornerRadius: isEnabled ? 100 : 0))
        .animation(.default)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
