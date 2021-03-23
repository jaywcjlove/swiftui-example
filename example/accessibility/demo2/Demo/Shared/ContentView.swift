//
//  ContentView.swift
//  Shared
//
//  Created by 王楚江 on 2021/3/23.
//

import SwiftUI

//@available(iOS 13, macCatalyst 13, tvOS 13, watchOS 6, *)
//struct ScaledFont: ViewModifier {
//    @Environment(\.sizeCategory) var sizeCategory
//    var name: String
//    var size: CGFloat
//
//    func body(content: Content) -> some View {
//       let scaledSize = UIFontMetrics.default.scaledValue(for: size)
//        return content.font(.custom(name, size: scaledSize))
//    }
//}

//@available(iOS 13, macCatalyst 13, tvOS 13, watchOS 6, *)
//extension View {
//    func scaledFont(name: String, size: CGFloat) -> some View {
//        return self.modifier(ScaledFont(name: name, size: size))
//    }
//}


@available(iOS 13, macCatalyst 13, tvOS 13, watchOS 6, *)
extension View {
    func scaledFont(name: String, size: CGFloat) -> some View {
        return self.modifier(ScaledFont(name: name, size: size))
    }
}

struct ScaledFont: ViewModifier {
    @Environment(\.sizeCategory) var sizeCategory
    var name: String
    var size: CGFloat

    func body(content: Content) -> some View {
       let scaledSize = UIFontMetrics.default.scaledValue(for: size)
        return content.font(.custom(name, size: scaledSize))
    }
}

struct ContentView: View {
    var body: some View {
        Text("Hello World")
        Text("Hello World")
            .scaledFont(name: "Georgia", size: 12)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
