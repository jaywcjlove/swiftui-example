如何在亮(light)和黑暗(dark)模式下预览布局？
===

大多数 Apple 的操作系统都支持光线和黑暗模式用户界面，因此 `SwiftUI` 支持此功能的支持并不奇怪。

甚至更好，一旦您设计了界面 `Xcode`，允许您通过在预览中设置 `.preferredColorScheme()` 修改器值来预览您的外观中的布局。

例如，这显示了使用 `dark` 模式的预览：

```swift
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.dark)
    }
}
```

如果您希望并排看到亮(light)和黑暗(dark)模式，请在组中放置多个预览，如下所示：

```swift
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) { 
             ContentView().preferredColorScheme($0)
        }
    }
}
```

有一点额外简明，你可以进一步下来：

```swift
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self, content: ContentView().preferredColorScheme)
    }
}
```

提示：如果您的预览缩小，则应滚动或缩小到其他预览。