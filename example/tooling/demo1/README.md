如何以不同的动态类型大小预览布局？
===

在构建应用程序时，确保您的布局与所有动态类型的范围都很好。 这部分是因为 `SwiftUI` 本身支持它，部分原因是许多人使用较小的字体大小，因为它们想要更高的信息密度，但主要是因为许多具有可访问性的人都需要依赖它。

幸运的是，所有 `SwiftUI` 的组件本身适应动态类型大小，并且甚至可以通过使用预览中的 `\.sizeCategory` 环境值预览各种大小的设计

例如，如果您想查看视图如何使用额外的小文本，请将 `.environment(\.sizeCategory, .extraSmall)` 添加到您的内容视图预览，如下所示： 

```swift
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      Group {
         ContentView()
            .environment(\.sizeCategory, .extraSmall)
      }
   }
}
```

您还可以发送一组预览，所有这些预览，都使用不同的大小类别。 这允许您在各个字体并排的各个字体上看到相同的设计。

因此，此代码以额外的小尺寸，规则尺寸和最大的尺寸显示设计：

```swift
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.sizeCategory, .extraSmall)
        ContentView()
        ContentView()
            .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)
    }
}
```

如果您的设计在所有三个中都有伟大的工作，那么你很高兴。

提示：如果您的预览缩小，则应滚动或缩小到其他预览。