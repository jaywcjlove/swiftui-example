如何为 `UIViewRepresentable` 结构创建修饰符？
===

在 `UIViewRepresentable` 结构中包装 `UIView` 是将现有的 `UIKit` 带入您的 `SwiftUI` 应用程序的好方法，您甚至可以添加自己的自定义修改器来调整视图在运行时工作的方式。

要进行此工作，您应该为要在底层 `UIView` 上调整的所有值的私有属性，然后创建调整方法。 这些方法中的每一种都应拍摄您的 `SwiftUI` 可代表性的副本 - 而不是基础 `UIView` - 然后调整您之前创建的私有属性以反映新状态。

一旦完成，`SwiftUI`将确保触发 `UpdateUiview()`方法，此时您将私有属性复制到 `UIView` 中以确保更新。

作为一个示例，您可以创建 `UIViewRepresentable` 以将 `UisearchBar` 桥接到 `SwiftUI`，但您可能希望其某些方面是可自定义的，例如其占位符文本。 首先，您可以为其占位符创建带有额外私有财产的可代表性：

```swift
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
```

其次，在可表示的修饰符上创建一个调整私有属性：

```swift
// 任何调整搜索字段的修改器 - 复制自我，调整，然后返回。
extension SearchField {
    func placeholder(_ string: String) -> SearchField {
        var view = self
        view.placeholder = string
        return view
    }
}
```

现在你们都设置了使用它。 例如，这将使用我们的 `.placeholder()` 修改器创建一个 `SearchField` 视图，但每次单击按钮时，我们会随机化占位符，以便您可以看到所有操作：

```swift
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
```