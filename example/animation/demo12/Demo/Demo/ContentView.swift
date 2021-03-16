//
//  ContentView.swift
//  Demo
//
//  Created by 王楚江 on 2021/3/16.
//

import SwiftUI

struct AnimatableSystemFontModifier: AnimatableModifier {
    var size: CGFloat
    var weight: Font.Weight
    var design: Font.Design

    var animatableData: CGFloat {
        get { size }
        set { size = newValue }
    }

    func body(content: Content) -> some View {
        content
            .font(.system(size: size, weight: weight, design: design))
    }
}

extension View {
    func animatableSystemFont(size: CGFloat, weight: Font.Weight = .regular, design: Font.Design = .default) -> some View {
        self.modifier(AnimatableSystemFontModifier(size: size, weight: weight, design: design))
    }
}

struct ContentView: View {
    @State private var fontSize: CGFloat = 32

    var body: some View {
        Text("Hello, World!")
            .animatableSystemFont(size: fontSize)
            .onTapGesture {
                withAnimation(Animation.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 1).repeatForever()) {
                    fontSize = 72
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
