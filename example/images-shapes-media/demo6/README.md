如何使用图像和其他视图作为背景？
---

SwiftUI 没有专用的修饰符来显示背景颜色或图像，而是使用其 `background()` 修饰符指定任何类型的背景视图。

例如，这将创建一个具有大字体的文本视图，然后在其后放置一个 `100x100` 的图像：

```swift
Text("Hacking with Swift")
    .font(.system(size: 48))
    .padding(50)
    .background(
        Image("singapore")
            .resizable()
    )
```

但是，它不必是图像。 例如，这将创建相同的文本视图，然后在其后放置一个 `50x50` 的红色圆圈：

```swift
Text("Hacking with Swift")
    .font(.largeTitle)
    .padding()
    .background(Circle()
        .fill(Color.red)
        .frame(width: 50, height: 50))
```

默认情况下，背景视图会自动占用需要完全可见的空间，但是如果您愿意，可以使用 `clipped()` 修饰符将其裁剪为其父视图的大小：

```swift
Text("Hacking with Swift")
    .font(.largeTitle)
    .padding()
    .background(
        Circle()
            .fill(Color.red)
            .frame(width: 100, height: 100)
    )
    .clipped()
```

明确地说，您可以将任何视图用作背景 – 例如，如果需要，可以使用另一个文本视图。