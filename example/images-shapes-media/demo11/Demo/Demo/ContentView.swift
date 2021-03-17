//
//  ContentView.swift
//  Demo
//
//  Created by 王楚江 on 2021/3/17.
//

import SwiftUI
import AVKit

struct ContentView: View {
    var body: some View {
        VideoPlayer(player: AVPlayer(url:  Bundle.main.url(forResource: "trailer", withExtension: "mp4")!))
            .frame(height: 400)
        VideoPlayer(player: AVPlayer(url:  URL(string: "https://media.w3.org/2010/05/sintel/trailer.mp4")!)) {
            VStack {
                Text("Watermark")
                    .foregroundColor(.black)
                    .background(Color.white.opacity(0.7))
                Spacer()
            }
            .frame(width: 400, height: 300)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
