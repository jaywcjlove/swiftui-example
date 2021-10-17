如何使用文本编辑器创建多行可编辑文本 `TextEditor`？
===

SwiftUI 具有用于处理多行滚动文本的 `TextEditor` 视图。 您可以设置字体，根据需要更改颜色，甚至可以调整行距以及可以创建多少行。

您需要使用 `@State` 或类似方法将文本字段的当前值存储在某个位置。 例如，我们可以创建一个文本视图，以允许用户输入个人资料数据，如下所示：

```swift
struct ContentView: View {
    @State private var profileText: String = "Enter your bio"

    var body: some View {
        TextEditor(text: $profileText)
            .foregroundColor(.secondary)
    }
}
```

对于单行文本输入，请改用 `TextField`。