//
//  ContentView.swift
//  Shared
//
//  Created by 王楚江 on 2021/3/19.
//

import SwiftUI

struct ContentView: View {
    @State private var downloadAmount = 0.0
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack {
            ProgressView("Downloading…", value: downloadAmount, total: 100)
        }
        .onReceive(timer) { _ in
            if downloadAmount < 100 {
                downloadAmount += 2
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
