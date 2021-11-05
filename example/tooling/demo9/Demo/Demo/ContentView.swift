//
//  ContentView.swift
//  Demo
//
//  Created by 王楚江 on 2021/11/5.
//

import SwiftUI

class EvilStateObject: ObservableObject {
  var timer: Timer?

  init() {
    timer = Timer.scheduledTimer(
      withTimeInterval: 1,
      repeats: true
    ) { _ in
      if Int.random(in: 1...5) == 1 {
          self.objectWillChange.send()
      }
    }
  }
}


extension ShapeStyle where Self == Color {
  static var random: Color {
    Color(
      red: .random(in: 0...1),
      green: .random(in: 0...1),
      blue: .random(in: 0...1)
    )
  }
}

struct ContentView: View {
    @StateObject private var evilObject = EvilStateObject()
    var body: some View {
//        print(Self._printChanges())
        return Text("Hello, world!")
            .background(.random)
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
