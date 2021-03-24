//
//  ContentView.swift
//  Shared
//
//  Created by 王楚江 on 2021/3/24.
//

import SwiftUI

struct SearchField: UIViewRepresentable {
    @Binding var text: String

    private var placeholder = ""

    init(text: Binding<String>) {
        _text = text
    }

    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar()
        searchBar.placeholder = placeholder
        return searchBar
    }

    // 始终在更新时复制占位符文本
    func updateUIView(_ uiView: UISearchBar, context: Context) {
        uiView.text = text
        uiView.placeholder = placeholder
    }
}

// 任何调整搜索字段的修改器 - 复制自我，调整，然后返回。
extension SearchField {
    func placeholder(_ string: String) -> SearchField {
        var view = self
        view.placeholder = string
        return view
    }
}

struct ContentView: View {
    @State private var text = ""
    @State private var placeHolder = "Hello, world!"

    var body: some View {
        VStack {
            SearchField(text: $text)
                .placeholder(placeHolder)

            Button("Tap me") {
                // 随机化每个按下占位符，以证明这作品
                placeHolder = UUID().uuidString
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
