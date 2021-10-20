//
//  ContentView.swift
//  Shared
//
//  Created by 王楚江 on 2021/10/20.
//

import SwiftUI

struct ContentView: View {
  @State private var password = ""

  var body: some View {
      if #available(iOS 15.0, *) {
          SecureField("Password", text: $password)
              .onSubmit {
                  print("Authenticating…")
              }
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
