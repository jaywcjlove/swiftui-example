//
//  ContentView.swift
//  Demo
//
//  Created by 王楚江 on 2021/10/20.
//

import SwiftUI

@available(iOS 15.0, *)
struct ContentView: View {
  @State private var name = "Taylor"

  var body: some View {
    TextField("Enter your name", text: $name)
      .textFieldStyle(.roundedBorder)
      .toolbar {
        ToolbarItemGroup(placement: .keyboard) {
          Button("Click me!") {
              print("Clicked")
          }
        }
      }
    ContentViewMore()
  }
}

@available(iOS 15.0, *)
struct ContentViewMore: View {
  @State private var name = "Taylor Swift"
  @FocusState var isInputActive: Bool

  var body: some View {
    NavigationView {
      TextField("Enter your name", text: $name)
        .textFieldStyle(.roundedBorder)
        .focused($isInputActive)
        .toolbar {
          ToolbarItemGroup(placement: .keyboard) {
              Spacer()

              Button("Done") {
                  isInputActive = false
              }
          }
        }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 15.0, *) {
            ContentView()
        } else {
            // Fallback on earlier versions
        }
    }
}
