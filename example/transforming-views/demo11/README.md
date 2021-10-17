如何放大或缩小视图？
===

SwiftUI 的 `scaleEffect()` 修饰符使我们可以自由地增加或减小视图的大小。

例如，我们可以使文本视图的大小是其常规大小的五倍，如下所示：

```swift
Text("Up we go")
    .scaleEffect(5)
    .frame(width: 300, height: 300)
```

如果需要，可以独立缩放 `X` 和 `Y` 尺寸，从而可以像这样挤压视图：

```swift
Text("Up we go")
    .scaleEffect(x: 1, y: 5)
    .frame(width: 300, height: 300)
```

如果需要更多控制，可以为缩放指定锚点，如下所示：

```swift
Text("Up we go")
    .scaleEffect(2, anchor: .bottomTrailing)
    .frame(width: 300, height: 300)
```

这使文本视图从右下角开始缩放，是其常规大小的两倍。

提示：放大视图不会导致它以新的大小重新绘制，而只是向上或向下拉伸。 这意味着小文本看起来会模糊，小图像可能看起来像像素化或模糊。