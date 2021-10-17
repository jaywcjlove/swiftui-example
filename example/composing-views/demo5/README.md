如何为 `UIViewRepresentable` 结构创建修饰符？
===

虽然 `SwiftUI` 在提供许多 `UIView`子类的情况下做得很好，但目前它还没有它们。 幸运的是，为您想要的 `UIView` 创建自定义包装并不难。

例如，让我们为 `UITextView` 创建一个简单的 `SwiftUI` 包装作为富文本编辑器的基础。 这需要四个步骤：

1. 创建符合 `UIViewRepresentable` 的结构。
2. 定义一个存储我们正在使用的文本字符串的属性。
3. 给它一个将返回文本视图的 `makeUIView()` 方法。
4. 添加 `updateUIView()` 方法，每当文本视图的数据已更改时将被调用。

在代码中，我们最终结束了：

```swift
struct TextView: UIViewRepresentable {
    @Binding var text: NSMutableAttributedString

    func makeUIView(context: Context) -> UITextView {
        UITextView()
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.attributedText = text
    }
}
```

那就是它！ 您现在可以立即使用 `SwiftUI` 视图中的 `TextView` 组件，例如：

```swift
struct ContentView: View {
    @State var text = NSMutableAttributedString(string: "")

    var body: some View {
        TextView(text: $text)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    }
}
```

因为它使用归属文本，您可以添加一些按钮以启用格式，例如粗体(bold)，斜体(italics)等。