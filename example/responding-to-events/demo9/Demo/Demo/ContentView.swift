//
//  ContentView.swift
//  Demo
//
//  Created by 王楚江 on 2021/10/20.
//

import SwiftUI

struct Message: Decodable, Identifiable {
  let id: Int
  let cnname: String
  let name: String
  let fullname: String
  let alpha2: String
  let alpha3: String
  let numeric: Int
}

struct ContentView: View {
  @State private var messages = [Message]()

  var body: some View {
    if #available(iOS 15.0, *) {
      NavigationView {
        List(messages) { message in
            VStack(alignment: .leading) {
                Text(message.cnname)
                    .font(.headline)
                Text(message.name)
            }
        }
        .navigationTitle("Inbox")
      }
      .task {
          do {
              let url = URL(string: "https://unpkg.com/province-city-china@8.0.0/dist/country.json")!
              let (data, _) = try await URLSession.shared.data(from: url)
              messages = try JSONDecoder().decode([Message].self, from: data)
          } catch {
              messages = []
          }
      }
    } else {
        EmptyView()
        // Fallback on earlier versions
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
