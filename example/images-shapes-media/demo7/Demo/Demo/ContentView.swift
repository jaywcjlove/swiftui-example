//
//  ContentView.swift
//  Demo
//
//  Created by 王楚江 on 2021/3/17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Rectangle()
                .fill(Color.red)
                .frame(width: 200, height: 200)
            Circle()
                .fill(Color.blue)
                .frame(width: 100, height: 100)
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.green)
                .frame(width: 150, height: 100)
            
            Capsule()
                .fill(Color.green)
                .frame(width: 150, height: 100)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
