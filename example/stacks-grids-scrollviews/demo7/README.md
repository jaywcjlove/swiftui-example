如何使用尺寸类创建不同的布局？
===

SwiftUI 通过将大小型暴露在环境中供我们阅读来原生支持大小类。 要使用它们，首先创建一个 `@Environment` 对象，该对象将存储其值，然后在需要时检查该属性的值，查找 `.compact` 或 `.regular` 尺寸类。

例如：

```swift
struct ContentView: View {
    #if !os(macOS)
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    #endif

    var body: some View {
      #if !os(macOS)
      if horizontalSizeClass == .compact {
          Text("Compact")
      } else {
          Text("Regular")
      }
      #else
          Text("Regular2")
      #endif
    }
}
```

上面示例在 iPhone 中显示 `Compact` 在 iPad 中显示 `Regular`，在 macOS 中显示 `Regular2`

`Size` 类是通过将 `VStack` 或 `HStack` 用于内容来使用户界面智能地适应可用空间的好方法。例如，如果您有很多空间，则可以将事物水平放置，但在空间有限时切换为垂直布局。

⚠️ 注意： `horizontalSizeClass` 只适用于 iOS