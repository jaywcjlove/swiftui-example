如何检测到用户将鼠标悬停在视图上？
---

在 `SwiftUI` 中，任何连接了鼠标的 `macOS` 应用程序或任何 `iPadOS` 应用程序都可以检测到用户何时将其鼠标悬停在视图上，并做出适当的响应。

您将要使用两个修饰符：`onHover()` 和 `hoverEffect()`。 这些中的第一个允许您跟踪指针当前是否悬停在视图上方，并传递一个反映该状态的布尔值。 例如，根据指针是否悬停在文本上方，这将使某些文本变为红色或绿色：

```swift
struct ContentView: View {
    @State private var overText = false

    var body: some View {
        Text("Hello, World!")
            .foregroundColor(overText ? .green : .red)
            .onHover { over in
                overText = over
            }
    }
}
```

`hoverEffect()` 修饰符允许您选择以下三种方式之一：系统在发生悬停时突出显示视图：`.highlight` 将指针转换为视图形状，同时创建柔和的方向效果，`.lift` 将指针转换为形状 同时放大视图并在其后放置柔和阴影，`.automatic` 会选择它认为最合适的突出显示效果。

请注意，如果仅应用不带任何参数的 `hoverEffect()` 修饰符，则 `.automatic` 是默认设置，但它不仅仅是在 `.highlight` 和 `.lift` 之间进行选择-这是完全不同的效果，并且不会转换指针以匹配 您的视图的形状。

要尝试一下，下面的一些代码在屏幕上放置了可轻敲的文本标签，使其具有 `.lift` 悬停效果，以使其清晰可辨：

```swift
struct ContentView: View {
    var body: some View {
        Text("Tap me!")
            .font(.largeTitle)
            .hoverEffect(.lift)
            .onTapGesture {
                print("Text tapped")
            }
    }
}
```

提示：要在 `iPadOS` 模拟器上进行尝试，请转到 `I/O` 菜单，然后选择 `Input` > `Send Cursor to Device`。