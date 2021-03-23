//
//  ContentView.swift
//  Shared
//
//  Created by 王楚江 on 2021/3/23.
//

import SwiftUI

struct ContentView: View {
    @GestureState var dragAmount = CGSize.zero
    var body: some View {
        Image("niagara-falls")
            .offset(dragAmount)
            .gesture(
                DragGesture().updating($dragAmount) { value, state, transaction in
                    state = value.translation
                }
            )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
