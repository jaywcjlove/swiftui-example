//
//  ContentView.swift
//  Shared
//
//  Created by 王楚江 on 2022/3/9.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Card number")
                .font(.headline)

            Text("1234 5678 9012 3456")
                .privacySensitive()
            ContentViewRedactionReasons()
        }
    }
}

struct ContentViewRedactionReasons: View {
    @Environment(\.redactionReasons) var redactionReasons

    var body: some View {
        VStack {
            Text("Card number")
                .font(.headline)

            if redactionReasons.contains(.privacy) {
                Text("[HIDDEN]")
            } else {
                Text("1234 5678 9012 3456")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
