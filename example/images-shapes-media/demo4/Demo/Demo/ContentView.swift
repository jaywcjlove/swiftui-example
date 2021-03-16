//
//  ContentView.swift
//  Demo
//
//  Created by 王楚江 on 2021/3/17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Image(systemName: "cloud.heavyrain.fill")
        Image(systemName: "cloud.heavyrain.fill")
            .font(.largeTitle)
        Image(systemName: "cloud.heavyrain.fill")
            .font(.largeTitle)
            .foregroundColor(.red)
        
        Image(systemName: "cloud.sun.rain.fill")
            .renderingMode(.original)
            .font(.largeTitle)
            .padding()
            .background(Color.black)
            .clipShape(Circle())
        Image(systemName: "person.crop.circle.fill.badge.plus")
            .renderingMode(.original)
            .foregroundColor(.blue)
            .font(.largeTitle)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
