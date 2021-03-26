//
//  Settings.swift
//  Demo
//
//  Created by 王楚江 on 2021/3/27.
//

import SwiftUI

struct SettingsView: View {
//    @AppStorage("Color.zoom")
    @State private var selection = "Red"
    let colors = ["Red", "Green", "Blue", "Black", "Tartan"]

    var body: some View {
        Form {
            Picker("Select a paint color", selection: $selection) {
                ForEach(colors, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(InlinePickerStyle())
        }
        .frame(width: 300)
        .navigationTitle("Demo Settings")
        .padding(80)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
