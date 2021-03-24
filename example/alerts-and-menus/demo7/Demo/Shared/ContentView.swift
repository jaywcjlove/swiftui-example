//
//  ContentView.swift
//  Shared
//
//  Created by 王楚江 on 2021/3/24.
//

import SwiftUI
import StoreKit

struct ContentView: View {
    @State private var showRecommended = false

    var body: some View {
        Button("Show Recommended App") {
            showRecommended.toggle()
        }
        .appStoreOverlay(isPresented: $showRecommended) {
            SKOverlay.AppConfiguration(appIdentifier: "1440611372", position: .bottom)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
