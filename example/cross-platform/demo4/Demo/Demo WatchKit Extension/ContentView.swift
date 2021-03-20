//
//  ContentView.swift
//  Demo WatchKit Extension
//
//  Created by 王楚江 on 2021/3/21.
//

import SwiftUI

struct ContentView: View {
    @State var scrollAmount = 0.0

    var body: some View {
        Text("Scroll: \(scrollAmount)")
            .focusable(true)
            .digitalCrownRotation($scrollAmount, from: 1, through: 5, by: 0.1, sensitivity: .low, isContinuous: true, isHapticFeedbackEnabled: true)
//            .digitalCrownRotation($scrollAmount)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
