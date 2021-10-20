//
//  ContentView.swift
//  Demo
//
//  Created by 王楚江 on 2021/10/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            if #available(iOS 15.0, *) {
                Image(systemName: "theatermasks")
                    .symbolRenderingMode(.hierarchical)
                    .font(.system(size: 144))
                Image(systemName: "theatermasks")
                    .symbolRenderingMode(.hierarchical)
                    .foregroundColor(.blue)
                    .font(.system(size: 144))
                Image(systemName: "shareplay")
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(.blue, .black)
                    .font(.system(size: 144))
                Image(systemName: "person.3.sequence.fill")
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(.blue, .green, .red)
                    .font(.system(size: 144))
                Image(systemName: "person.3.sequence.fill")
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(
                        .linearGradient(colors: [.red, .black], startPoint: .top, endPoint: .bottomTrailing),
                        .linearGradient(colors: [.green, .black], startPoint: .top, endPoint: .bottomTrailing),
                        .linearGradient(colors: [.blue, .black], startPoint: .top, endPoint: .bottomTrailing)
                    )
                    .font(.system(size: 144))
            } else {
                // Fallback on earlier versions
            }
        }
        .padding(.top, 100)
        .padding(.bottom, 100)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
