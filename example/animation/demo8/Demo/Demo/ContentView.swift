//
//  ContentView.swift
//  Demo
//
//  Created by 王楚江 on 2021/3/16.
//

import SwiftUI

struct ContentView: View {
    @Namespace private var animation
    @State private var isFlipped = false

    var body: some View {
        VStack {
            if isFlipped {
                Circle()
                    .fill(Color.red)
                    .frame(width: 44, height: 44)
                    .matchedGeometryEffect(id: "Shape", in: animation)
                Text("Taylor Swift – 1989")
                    .matchedGeometryEffect(id: "AlbumTitle", in: animation)
                    .font(.headline)
            } else {
                Text("Taylor Swift – 1989")
                    .matchedGeometryEffect(id: "AlbumTitle", in: animation)
                    .font(.headline)
                Circle()
                    .fill(Color.blue)
                    .frame(width: 44, height: 44)
                    .matchedGeometryEffect(id: "Shape", in: animation)
            }
        }
        .onTapGesture {
            withAnimation {
                isFlipped.toggle()
            }
        }
        .frame(width: 200, height: 100, alignment: .center)
        .padding(20)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
