如何平铺图像？
----

如果要求 `SwiftUI` 使图片视图占用比图片设计的空间更多的空间，则默认行为是拉伸图片以使其适合您所需的空间。 但是，并不需要那样做：它还可以平铺图像，即水平和垂直重复图像，从而完全填充空间。

关键是将 `resizable()` 修饰符与其 `resizingMode` 参数一起使用。 该名称可以是 `.stretch`（默认设置）或 `.tile`，其中 `.tile` 是您要查找的内容。

在代码中，它看起来像这样：

```swift
Image("logo")
    .resizable(resizingMode: .tile)
```

如果您只希望平铺图像的一部分（将一个或多个边缘固定在图像视图的边缘），则可以为第一个参数提供边缘插图，如下所示：

```swift
Image("logo")
    .resizable(capInsets: EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20), resizingMode: .tile)
```