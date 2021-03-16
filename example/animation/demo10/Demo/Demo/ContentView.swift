//
//  ContentView.swift
//  Demo
//
//  Created by 王楚江 on 2021/3/16.
//

import SwiftUI

struct ContentView: View {
    @State private var showDetails = false

    var body: some View {
        VStack {
            Button("Press to show details") {
                withAnimation {
                    showDetails.toggle()
                }
            }

            if showDetails {
                Text("Details go here.")
                    .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .bottom)))
            }
        }
        .frame(width: 300, height: 260, alignment: .center)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
