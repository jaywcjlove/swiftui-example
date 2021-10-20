如何从 URL 加载远程图像？
===

SwiftUI 有一个专用的 [`AsyncImage`](https://developer.apple.com/documentation/swiftui/asyncimage) 用于从互联网下载和显示远程图像。 以最简单的形式，您可以只传递一个 URL，如下所示：

```swift
if #available(iOS 15.0, *) {
  AsyncImage(url: URL(string: "https://avatars.githubusercontent.com/u/1680273?v=4"))
} else {
  // Fallback on earlier versions
}
```

> 🚧  兼容性
> - iOS 15.0+
> - iPadOS 15.0+
> - macOS 12.0+ Beta
> - Mac Catalyst 15.0+ Beta
> - tvOS 15.0+
> - watchOS 8.0+
<!--rehype:style=border-left: 8px solid #ffe564;background-color: #ffe56440;padding: 12px 16px;-->

![](./imgs/001.png)<!--rehype:style=max-width:320px-->

请注意 URL 是如何可选的——如果 URL 字符串无效，`AsyncImage` 将只显示一个默认的灰色占位符。 如果由于某种原因无法加载图像 —— 如果用户离线，或者图像不存在——那么系统将继续显示相同的占位符图像。

![](./imgs/002.png)<!--rehype:style=max-width:320px-->

因为 `SwiftUI` 不知道下载的图像有多大，默认情况下 `AsyncImage` 在加载时具有灵活的宽度和高度。 因此，除非您另外指定，否则在加载图像时它会在您的 UI 中占用大量空间，然后在加载图像后立即跳转到正确的大小。

尽管您可以将框架附加到您的图像，但默认情况下它只会影响占位符 - 如果您完成的图像以不同的尺寸到达，您的 UI 将不得不进行调整以适应它。

更好的解决方案是添加函数来控制结果图像的显示方式以及您想要的占位符类型。 例如，这会获取我们的图像并使其可调整大小，但在加载时使用红色占位符颜色：

```swift
AsyncImage(url: URL(string: "https://jaywcjlove.github.io/swiftui-example/example/images-shapes-media/demo13/avatars.png")) { image in
    image.resizable()
      .aspectRatio(contentMode: .fit)
      .clipShape(RoundedRectangle(cornerRadius: 15))
      .padding()
} placeholder: {
    Color.red
}
.frame(width: 128, height: 128)
.clipShape(RoundedRectangle(cornerRadius: 25))
```

![](./imgs/003.png)<!--rehype:style=max-width:320px-->

因为生成的图像和占位符颜色现在都可以调整大小，所以 `frame()` 修饰符能够确保我们的 `AsyncImage` 始终保持正确的大小。 在你问之前：不，`AsyncImage` 上没有直接可用的 `resizable()` 修饰符。

注意：默认情况下，假设图像的比例为 `1`，这意味着专为非视网膜屏幕设计。 但是，如果您已经知道正确的比例，您也可以使用第二个参数控制比例：

```swift
AsyncImage(url: URL(string: "https://jaywcjlove.github.io/swiftui-example/example/images-shapes-media/demo13/avatars@2x.png"), scale: 2)
```