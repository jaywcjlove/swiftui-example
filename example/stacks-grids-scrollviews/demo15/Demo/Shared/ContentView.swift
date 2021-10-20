//
//  ContentView.swift
//  Shared
//
//  Created by 王楚江 on 2021/10/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Image("singapore")
            
            if #available(iOS 15.0, *) {
                Text("Visit Singapore")
                    .padding()
                    .background(.thinMaterial)
            } else {
                // Fallback on earlier versions
            }
        }
        ZStack {
            Image("singapore")

            if #available(iOS 15.0, *) {
                Text("Visit Singapore")
                    .foregroundColor(.secondary)
                    .padding()
                    .background(.ultraThinMaterial)
            } else {
                // Fallback on earlier versions
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
