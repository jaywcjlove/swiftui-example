//
//  ContentView.swift
//  Shared
//
//  Created by 王楚江 on 2021/10/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        if #available(iOS 15.0, *) {
            Button("Buy: $0.99") {
                print("Buying…")
            }
            .buttonStyle(.bordered)
            .padding(.bottom, 50)
            
            Button("Buy: $0.99") {
                print("Buying for $0.99")
            }
            .buttonStyle(.borderedProminent)
            .padding(.bottom, 50)
            
            Button("Submit") {
                print("Submitting…")
            }
            .tint(.indigo)
            .buttonStyle(.borderedProminent)
            .padding(.bottom, 50)
            
            Button("Delete", role: .destructive) {
                print("Deleting…")
            }
            .buttonStyle(.borderedProminent)
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
