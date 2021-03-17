//
//  ContentView.swift
//  Demo
//
//  Created by 王楚江 on 2021/3/17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hacking with Swift")
            .font(.system(size: 48))
            .padding(50)
            .background(
                Image("singapore")
                    .resizable()
            )
        
        Text("Hacking with Swift")
            .font(.largeTitle)
            .padding()
            .background(
                Circle()
                    .fill(Color.red)
                    .frame(width: 100, height: 100)
            )
            .clipped()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
