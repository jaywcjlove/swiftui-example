如何渲染渐变？
---

SwiftUI 为我们提供了各种渐变选项，所有这些选项都可以以多种方式使用。 例如，您可以使用白色到黑色的线性渐变来渲染文本视图，如下所示：

```swift
Text("Hello World")
    .padding()
    .foregroundColor(.white)
    .font(.largeTitle)
    .background(
        LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom)
    )
```

颜色被指定为一个数组，您可以根据需要设置任意多个颜色–默认情况下，`SwiftUI` 会将它们均匀地隔开。 因此，我们可以像这样从白色变成红色再变成黑色：

```swift
Text("Hello World")
    .padding()
    .foregroundColor(.white)
    .font(.largeTitle)
    .background(
        LinearGradient(gradient: Gradient(colors: [.white, .red, .black]), startPoint: .top, endPoint: .bottom)
    )
```

要制作水平渐变而不是垂直渐变，请使用 `.lead` 和 `.trailing` 作为起点和终点：