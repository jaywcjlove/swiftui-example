//
//  ContentView.swift
//  Shared
//
//  Created by 王楚江 on 2021/3/20.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedStrength = "Mild"
    let strengths = ["Mild", "Medium", "Mature"]

    var body: some View {
        NavigationView {
            Form {
                Section {
                    #if !os(macOS)
                    Picker("Strength", selection: $selectedStrength) {
                        ForEach(strengths, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    #else
                    Picker("Strength", selection: $selectedStrength) {
                        ForEach(strengths, id: \.self) {
                            Text($0)
                        }
                    }
                    #endif
                }
            }
            .navigationTitle("Select your cheese")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
