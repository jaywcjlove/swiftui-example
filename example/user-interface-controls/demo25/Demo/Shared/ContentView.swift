//
//  ContentView.swift
//  Shared
//
//  Created by 王楚江 on 2021/3/30.
//

import SwiftUI


extension NSTextView {
    open override var frame: CGRect {
        didSet {
            backgroundColor = .clear
            drawsBackground = true
        }
    }
}

struct ContentView: View {
    @State var text = ""
    var body: some View {
        TextEditor(text: $text)
            .background(Color.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
