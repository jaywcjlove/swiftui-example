//
//  ContentView.swift
//  Shared
//
//  Created by 王楚江 on 2021/3/19.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedNumber = 0

    var body: some View {
        Picker("Select a number", selection: $selectedNumber) {
            ForEach(0..<10) {
                Text("\($0)")
            }
        }
        
        Picker("Select a number", selection: $selectedNumber) {
            ForEach(0..<10) {
                Text("\($0)")
            }
        }
        .labelsHidden()
        
        Picker(selection: $selectedNumber, label: EmptyView()) {
            ForEach(0..<10) {
                Text("\($0)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
