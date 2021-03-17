如何使用 `GeometryReader` 提供相对大小？
---

尽管通常最好让 `SwiftUI` 使用堆栈执行自动布局，但也可以使用 `GeometryReader` 提供相对于其容器的视图尺寸。 例如，如果您希望两个视图占用屏幕上可用宽度的一半，则无法使用硬编码值，因为我们无法提前知道屏幕的宽度。

为了解决这个问题，`GeometryReader` 为我们提供了一个输入值，告诉我们可用的宽度和高度，然后我们可以将其用于需要的任何计算中。 因此，如果我们有两个视图，并且我们希望其中一个占据屏幕的三分之一，而另一个占据三分之二，则可以这样写：

```swift
GeometryReader { geometry in
    HStack(spacing: 0) {
        Text("Left")
            .font(.largeTitle)
            .foregroundColor(.black)
            .frame(width: geometry.size.width * 0.33)
            .background(Color.yellow)
        Text("Right")
            .font(.largeTitle)
            .foregroundColor(.black)
            .frame(width: geometry.size.width * 0.67)
            .background(Color.orange)
    }
}
.frame(height: 50)
```

注意：`GeometryReader` 不考虑视图层次结构中更远的偏移量或间距，这就是为什么 `HStack` 上没有间距的原因–如果我们在其中允许间距，则视图对于可用空间会有点太大。
