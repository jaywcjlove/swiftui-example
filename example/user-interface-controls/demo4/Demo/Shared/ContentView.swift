//
//  ContentView.swift
//  Shared
//
//  Created by 王楚江 on 2021/3/19.
//

import SwiftUI

struct ContentView: View {
    @State private var name: String = "Tim"
    @State var username : String?

    var body: some View {
        VStack(alignment: .leading) {
            TextField("Enter your name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Text("Hello, \(name)!")
            
            TextField("User Name", text: $name, onEditingChanged: { (value) in
                print("onEditingChanged:\(self.username ?? "3")")
            }) {
                print("onCommit:\(self.username ?? "4")")
            }.textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .frame(width: 360, height: 200, alignment: .leading)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
