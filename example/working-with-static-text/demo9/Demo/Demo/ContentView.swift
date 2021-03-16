//
//  ContentView.swift
//  Demo
//
//  Created by 王楚江 on 2021/3/17.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.redactionReasons) var redactionReasons
    let bio = "The rain in Spain falls mainly on the Spaniards"

    var body: some View {
        VStack {
            Text("This is placeholder text")
            Text("And so is this")
        }
        .font(.title)
        .redacted(reason: .placeholder)
        VStack {
            if redactionReasons == .placeholder {
                Text("Loading…")
            } else {
                Text(bio)
                    .redacted(reason: redactionReasons)
            }
        }
        .frame(width: 500, height: 360, alignment: .center)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
