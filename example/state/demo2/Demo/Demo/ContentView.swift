//
//  ContentView.swift
//  Demo
//
//  Created by 王楚江 on 2021/3/16.
//

import SwiftUI

class Player: ObservableObject {
  @Published var name = "Taylor"
  @Published var age = 26
}

struct ContentView: View {
  @StateObject var player = Player()
  var body: some View {
    NavigationView {
      NavigationLink(destination: PlayerNameView(player: player)) {
          Text("Show detail view")
      }
    }
  }
}

struct PlayerNameView: View {
  @ObservedObject var player: Player

  var body: some View {
      Text("Hello, \(player.name)!")
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
      ContentView()
  }
}
