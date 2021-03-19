//
//  ContentView.swift
//  Shared
//
//  Created by 王楚江 on 2021/3/20.
//

import SwiftUI

struct ContentView: View {
    @State private var enableLogging = false
    @State private var selectedColor = "Red"
    @State private var colors = ["Red", "Green", "Blue"]

    var body: some View {
        Form {
            Picker("Select a color", selection: $selectedColor) {
                ForEach(colors, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(SegmentedPickerStyle())

            Toggle("Enable Logging", isOn: $enableLogging)

            Button("Save changes") {
                // activate theme!
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
