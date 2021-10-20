//
//  ContentView.swift
//  Demo
//
//  Created by 王楚江 on 2021/10/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        if #available(iOS 15.0, *) {
            HStack {
                Image(systemName: "clock.fill")
                Text("Set the time")
            }
            .font(.largeTitle.bold())
            .foregroundStyle(.quaternary)
            .padding(.bottom, 120)
            
            HStack {
                Image(systemName: "clock.fill")
                Text("Set the time")
            }
            .font(.largeTitle.bold())
            .foregroundStyle(
                .linearGradient(
                    colors: [.red, .black],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
        } else {
            // Fallback on earlier versions
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
