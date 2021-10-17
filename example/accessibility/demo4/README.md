如何检测暗模式？
===

SwiftUI 使我们能够使用 `colorScheme` 环境键来检测当前是否启用了暗模式或亮模式。 如果使用 `@Environment` 声明此内容，则可以在视图中引用它，并且在更改配色方案时将自动重新加载它们。

例如，根据当前的配色方案，这将打印“在暗模式下”或“在亮模式下”：

```swift
struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        Text(colorScheme == .dark ? "在暗模式下" : "在亮模式下")
    }
}
```

通常，这仅应用于自定义绘图-如果要启用深色和浅色或深色和浅色图像，这些都可以使用资产目录来完成，并且在配色方案更改时也可以重新加载。