//
//  ContentView.swift
//  Demo
//
//  Created by 王楚江 on 2021/3/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("This is an extremely long text string that will never fit even the widest of phones without wrapping")
            .font(.largeTitle)
            .frame(width: 300)
        
        Text("The best laid plans")
            .foregroundColor(Color.red)
        
        Text("The best laid plans")
            .padding()
            .background(Color.red)
            .foregroundColor(.white)
            .font(.headline)
        
        Text("This is an extremely long text string that will never fit even the widest of phones without wrapping")
            .font(.largeTitle)
            .lineSpacing(50)
            .frame(width: 300)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
