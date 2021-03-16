如何在视图周围绘制边框？
---

SwiftUI 为我们提供了专用的 `border()` 修饰符，可在视图周围绘制边框。 根据您要指定笔划宽度还是拐角半径，它会有一些变化，因此这里有一些示例：

这会在文本视图周围添加一个简单的1点黑色边框：

```swift
Text("Examples with Swift")
    .border(Color.green)
```

如果要使边框不位于视图的边缘，请首先添加一些填充：

```swift
Text("Examples with Swift")
    .padding()
    .border(Color.green)
```

这将添加一个4点红色边框：

```swift
Text("Examples with Swift")
    .padding()
    .border(Color.red, width: 4)
```

如果您想要任何更高级的功能（例如，如果要舍入边框的角），则需要改用 `overlay()` 修饰符。 例如，这将添加一个带有 16 点圆角的 4 点蓝色边框：

```swift
Text("Examples with Swift")
    .padding()
    .overlay(
        RoundedRectangle(cornerRadius: 16)
            .stroke(Color.blue, lineWidth: 4)
    )
```

提示：对形状使用 `stroke()` 或 `strokeBorder()` ，对其他视图类型使用 `border()` 。
