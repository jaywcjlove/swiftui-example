//
//  ContentView.swift
//  Demo
//
//  Created by 王楚江 on 2021/10/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image("dog")
                .resizable()
                .frame(width:100, height:100)
                
            Image(systemName: "cloud.heavyrain.fill")
                .font(.largeTitle)
        }
        .frame(width: 440, height: 300, alignment: .center)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
