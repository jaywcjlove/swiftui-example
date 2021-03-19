如何在 `Safari` 中打开 Web 链接？
---

SwiftUI为我们提供了专用的 `Link` 视图，该视图看起来像一个按钮，但是在按下时会在 `Safari` 中打开一个 `URL`。 它非常易于使用-只需为其按钮标题加上要显示的目标 `URL`，如下所示：

```swift
Link("Learn SwiftUI", destination: URL(string: "https://www.apple.com")!)
```

由于它只是文本链接，因此可以使用字体，颜色等进行自定义：

```swift
Link("Visit Apple", destination: URL(string: "https://www.apple.com")!)
    .font(.title)
    .foregroundColor(.red)
```

而且，如果您想创建自己的视图而不是仅使用文本，也可以这样做：

```swift
Link(destination: URL(string: "https://www.apple.com")!) {
    Image(systemName: "link.circle.fill")
        .font(.largeTitle)
}
```

或者，您可以使用 `openURL` 环境键从代码中打开 `URL`，如下所示：

```swift
struct ContentView: View {
    @Environment(\.openURL) var openURL

    var body: some View {
        Button("Visit Apple") {
            openURL(URL(string: "https://www.apple.com")!)
        }
    }
}
```