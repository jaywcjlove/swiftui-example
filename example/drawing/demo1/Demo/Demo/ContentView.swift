//
//  ContentView.swift
//  Demo
//
//  Created by 王楚江 on 2021/3/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {

        ZStack {
            Rectangle()
                .fill(Color.black)
                .frame(width: 200, height: 200)

            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(Color.red)
                .frame(width: 200, height: 200)

            Capsule()
                .fill(Color.green)
                .frame(width: 100, height: 50)

            Ellipse()
                .fill(Color.blue)
                .frame(width: 100, height: 50)

            Circle()
                .fill(Color.white)
                .frame(width: 100, height: 50)
        }
        .padding(80)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
