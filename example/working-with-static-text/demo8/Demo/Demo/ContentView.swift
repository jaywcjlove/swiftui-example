//
//  ContentView.swift
//  Demo
//
//  Created by 王楚江 on 2021/3/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Label("Your account", systemImage: "person.crop.circle")
        Label("Your account", systemImage: "person.crop.circle")
            .font(.title)
        
        VStack {
            Label("Text Only", systemImage: "heart")
                .font(.title)
                .labelStyle(TitleOnlyLabelStyle())

            Label("Icon Only", systemImage: "star")
                .font(.title)
                .labelStyle(IconOnlyLabelStyle())

            Label {
                Text("Paul Hudson")
                    .foregroundColor(.primary)
                    .font(.largeTitle)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .clipShape(Capsule())
            } icon: {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.blue)
                    .frame(width: 64, height: 64)
            }
            
//            Label("Both", systemImage: "paperplane")
//                .font(.title)
//                .labelStyle(TitleAndIconLabelStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
