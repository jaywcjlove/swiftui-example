//
//  ContentView.swift
//  Demo
//
//  Created by 王楚江 on 2021/3/17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Image("niagara-falls")
            Text("Hacking with Swift")
                .font(.largeTitle)
                .background(Color.black)
                .foregroundColor(.white)
        }
        ZStack(alignment: .leading) {
            Image("niagara-falls")
            Text("Hacking with Swift")
                .font(.largeTitle)
                .background(Color.black)
                .foregroundColor(.white)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
