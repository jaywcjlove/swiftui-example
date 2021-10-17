什么是 `@ScaledMetric` 属性包装器？
===

SwiftUI 为我们提供了 `@ScaledMetric` 属性包装器，以定义应根据用户的动态类型设置自动缩放的数字。

在最基本的用法中，为您的属性提供默认值，然后 `@ScaledMetric` 将完成其余工作。 例如，这将根据用户的设置以不同的大小绘制同一张图片：

```swift
struct ContentView: View {
    @ScaledMetric var imageSize: CGFloat = 100

    var body: some View {
        Image(systemName: "cloud.sun.bolt.fill")
            .resizable()
            .frame(width: imageSize, height: imageSize)
    }
}
```

如果需要缩放以与其他特定文本匹配，则可以为属性包装器使用 `relativeTo` 参数，该参数可让您指定要匹配的字体大小。 例如，这将与较大的标题一起缩放：

```swift
@ScaledMetric(relativeTo: .largeTitle) var imageSize: CGFloat = 100
```
