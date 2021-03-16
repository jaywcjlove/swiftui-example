//
//  ContentView.swift
//  Demo
//
//  Created by 王楚江 on 2021/3/17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Image("rome")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 250)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
