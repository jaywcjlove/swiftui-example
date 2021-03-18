//
//  ContentView.swift
//  Shared
//
//  Created by 王楚江 on 2021/3/18.
//

import SwiftUI

struct AdaptiveStack<Content: View>: View {
    #if !os(macOS)
    @Environment(\.horizontalSizeClass) var sizeClass
    #endif
    let horizontalAlignment: HorizontalAlignment
    let verticalAlignment: VerticalAlignment
    let spacing: CGFloat?
    let content: () -> Content

    init(horizontalAlignment: HorizontalAlignment = .center, verticalAlignment: VerticalAlignment = .center, spacing: CGFloat? = nil, @ViewBuilder content: @escaping () -> Content) {
        self.horizontalAlignment = horizontalAlignment
        self.verticalAlignment = verticalAlignment
        self.spacing = spacing
        self.content = content
    }

    var body: some View {
        Group {
            #if !os(macOS)
            if sizeClass == .compact {
                VStack(alignment: horizontalAlignment, spacing: spacing, content: content)
            } else {
                HStack(alignment: verticalAlignment, spacing: spacing, content: content)
            }
            #else
            HStack(alignment: verticalAlignment, spacing: spacing, content: content)
            #endif
        }
    }
}

struct ContentView: View {
    var body: some View {
        AdaptiveStack {
            Text("Horizontal when there's lots of space")
            Text("but")
            Text("Vertical when space is restricted")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
