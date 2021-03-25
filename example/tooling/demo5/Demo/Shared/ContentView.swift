//
//  ContentView.swift
//  Shared
//
//  Created by 王楚江 on 2021/3/24.
//

import Combine
import SwiftUI

class FrequentUpdater: ObservableObject {
    let objectWillChange = PassthroughSubject<Void, Never>()
    var timer: Timer?

    init() {
        timer = Timer.scheduledTimer(
            withTimeInterval: 0.01,
            repeats: true
        ) { _ in
            self.objectWillChange.send()
        }
    }
}

struct ContentView: View {
    @ObservedObject var updater = FrequentUpdater()
    @State private var tapCount = 0

    var body: some View {
        VStack {
            Text("\(UUID().uuidString)")

            Button("Tap count: \(tapCount)") {
                tapCount += 1
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
