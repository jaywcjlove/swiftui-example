//
//  ContentView.swift
//  Demo
//
//  Created by 王楚江 on 2021/3/16.
//

import SwiftUI

struct ShrinkingSquares: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        for i in stride(from: 1, through: 100, by: 5.0) {
            let rect = CGRect(x: 0, y: 0, width: rect.width, height: rect.height)
            let insetRect = rect.insetBy(dx: CGFloat(i), dy: CGFloat(i))
            path.addRect(insetRect)
        }

        return path
    }
}

struct ContentView: View {
    var body: some View {
        ShrinkingSquares()
            .stroke()
            .frame(width: 200, height: 200)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
