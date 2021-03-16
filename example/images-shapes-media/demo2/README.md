如何调整图像适合其空间的展示方式？
---

`SwiftUI` 的图片视图可以以不同的方式缩放，就像 `UIImageView` 的内容模式一样。

默认情况下，图像视图会自动调整其大小以适应其内容，这可能会使它们超出屏幕范围。 如果添加 `resizable()` 修饰符，则图像将自动调整大小，以使其填满所有可用空间，无论是在您指定的帧内还是在屏幕上可用的任何空间：


```swift
Image("rome")
    .resizable()
    .frame(height: 200)
```

但是，这也可能导致图像的原始长宽比失真，因为它将在所有尺寸上拉伸所需的任何量以使其填充空间。

如果要保持其宽高比，则应使用 `.fill` 或 `.fit` 添加一个 `AspectRatio` 修饰符，如下所示：

```swift
Image("rome")
    .resizable()
    .aspectRatio(contentMode: .fit)
    .frame(width: 250)
```