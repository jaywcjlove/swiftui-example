按下按钮时如何显示菜单？
===

SwiftUI 为我们提供了一个专用视图，用于显示按钮的弹出菜单，称为菜单。 可以从简单的字符串或使用自定义视图创建此视图，但是可以通过两种方式发送各种按钮来控制要显示在菜单中的内容。

提示：在 `macOS` 上，`Menu`会自动呈现为下拉按钮。

例如，我们可以创建一个简单的按钮，其中包含以下几个选项：

```swift
struct ContentView: View {
    var body: some View {
        Menu("Options") {
            Button("Order Now", action: placeOrder)
            Button("Adjust Order", action: adjustOrder)
            Button("Cancel", action: cancelOrder)
        }
    }

    func placeOrder() { }
    func adjustOrder() { }
    func cancelOrder() { }
}
```

您还可以根据需要将菜单放置在菜单中，这将导致iOS在点击第一个选项时显示第二个菜单：

```swift
struct ContentView: View {
    var body: some View {
        Menu("Options") {
            Button("Order Now", action: placeOrder)
            Button("Adjust Order", action: adjustOrder)
            Menu("Advanced") {
                Button("Rename", action: rename)
                Button("Delay", action: delay)
            }
            Button("Cancel", action: cancelOrder)
        }
    }

    func placeOrder() { }
    func adjustOrder() { }
    func rename() { }
    func delay() { }
    func cancelOrder() { }
}
```

如果您想要使用一些文本和图标的自定义标签，则可以使用以下方法：

```swift
struct ContentView: View {
    var body: some View {
        Menu {
            Button("Order Now", action: placeOrder)
            Button("Adjust Order", action: adjustOrder)
        } label: {
            Label("Options", systemImage: "paperplane")
        }
    }

    func placeOrder() { }
    func adjustOrder() { }
}
```