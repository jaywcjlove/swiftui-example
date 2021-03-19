//
//  ContentView.swift
//  Shared
//
//  Created by 王楚江 on 2021/3/19.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.openURL) var openURL
    var body: some View {
        VStack {
            Link("Learn SwiftUI", destination: URL(string: "https://www.apple.com")!)
            
            Link("Visit Apple", destination: URL(string: "https://www.apple.com")!)
                .font(.title)
                .foregroundColor(.red)
            
            Button("Visit Apple") {
                openURL(URL(string: "https://www.apple.com")!)
            }
            Link(destination: URL(string: "https://www.apple.com")!) {
                Image(systemName: "link.circle.fill")
                    .font(.largeTitle)
            }
        }
        .frame(width: 350, height: 300, alignment: .center)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
