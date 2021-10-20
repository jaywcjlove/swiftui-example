//
//  ContentView.swift
//  Shared
//
//  Created by 王楚江 on 2021/10/20.
//

import SwiftUI

struct ContentView: View {
    @State private var username = ""

    var body: some View {
        if #available(iOS 15.0, *) {
            TextField("Username", text: $username)
                .submitLabel(.join)
        } else {
            // Fallback on earlier versions
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
