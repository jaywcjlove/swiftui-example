//
//  ContentView.swift
//  Shared
//
//  Created by 王楚江 on 2021/3/23.
//

import SwiftUI


struct PlayerNameView: View {
  @ObservedObject var order: Order

  var body: some View {
    Text("Hello, \(order.items[0])!")
  }
}

class Order: ObservableObject {
    @Published var items = [String](["111"])
}

struct ContentView: View {
    @EnvironmentObject var order: Order
    var body: some View {
        VStack {
            Button("Increase Score") {
//                print(order)
//                order.items = ["sss"]
//                order.items.append("test")
//                progress.score += 1
            }
        }
        .padding(10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
