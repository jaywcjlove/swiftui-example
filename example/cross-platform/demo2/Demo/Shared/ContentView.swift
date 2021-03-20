//
//  ContentView.swift
//  Shared
//
//  Created by 王楚江 on 2021/3/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List(1..<51) {
            Text("\($0)")
        }
        .listStyle(SidebarListStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
