//
//  ContentView.swift
//  Shared
//
//  Created by 王楚江 on 2021/3/18.
//

import SwiftUI

struct ContentView: View {
    #if !os(macOS)
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    #endif

    var body: some View {
      #if !os(macOS)
      if horizontalSizeClass == .compact {
          Text("Compact")
      } else {
          Text("Regular")
      }
      #else
          Text("Regular2")
      #endif
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
