//
//  ContentView.swift
//  Demo
//
//  Created by 王楚江 on 2021/3/16.
//

import SwiftUI

extension Binding {
    func onChange(_ handler: @escaping (Value) -> Void) -> Binding<Value> {
        Binding(
            get: { self.wrappedValue },
            set: { newValue in
                self.wrappedValue = newValue
                handler(newValue)
            }
        )
    }
}

struct ContentView: View {
    @State private var name = ""
    var body: some View {
        TextField("Enter your name:", text: $name.onChange(nameChanged))
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding(100)
    }

    func nameChanged(to value: String) {
        print("Name changed to \(name)!")
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
