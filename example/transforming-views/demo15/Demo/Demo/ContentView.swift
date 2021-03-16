//
//  ContentView.swift
//  Demo
//
//  Created by 王楚江 on 2021/3/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Image("laser-show")
            .resizable()
            .frame(width: 300, height: 300)
            .mask(Text("SWIFT!")
                .font(.system(size: 72)))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
