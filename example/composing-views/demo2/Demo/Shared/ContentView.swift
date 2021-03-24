//
//  ContentView.swift
//  Shared
//
//  Created by 王楚江 on 2021/3/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("SwiftUI ")
            .foregroundColor(.red)
        + Text("is ")
            .foregroundColor(.orange)
            .fontWeight(.black)
        + Text("awesome")
            .foregroundColor(.blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
