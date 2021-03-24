//
//  ContentView.swift
//  Shared
//
//  Created by 王楚江 on 2021/3/24.
//

import SwiftUI

struct ContentView: View {
    @State private var message = "Long press then drag"

    var body: some View {
        let longPress = LongPressGesture()
            .onEnded { _ in
                message = "Now drag me"
            }

        let drag = DragGesture()
            .onEnded { _ in
                message = "Success!"
            }

        let combined = longPress.sequenced(before: drag)

        Text(message)
            .gesture(combined)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
