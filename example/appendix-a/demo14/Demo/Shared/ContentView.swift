//
//  ContentView.swift
//  Shared
//
//  Created by 王楚江 on 2021/3/24.
//

import SwiftUI

struct ContentView: View {
    @ScaledMetric var imageSize: CGFloat = 100

    var body: some View {
        Image(systemName: "cloud.sun.bolt.fill")
            .resizable()
            .frame(width: imageSize, height: imageSize)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
