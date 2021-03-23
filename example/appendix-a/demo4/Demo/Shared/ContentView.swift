//
//  ContentView.swift
//  Shared
//
//  Created by 王楚江 on 2021/3/24.
//

import SwiftUI

class User: ObservableObject {
    var username = "kenny"
}

struct ContentView: View {
    @StateObject var user = User()
    var body: some View {
        Text("Hello, world! \(user.username)")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
