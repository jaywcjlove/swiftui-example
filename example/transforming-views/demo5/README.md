如何在视图内绘制边框？
----

`SwiftUI` 为我们提供了 `stroke()` 和 `strokeBorder()` 修饰符，用于在形状周围绘制边框，它们的行为略有不同：

`strokeBorder()` 修饰符将视图插入边框宽度的一半，然后应用笔触，这意味着整个边框都在视图内部绘制。
`stroke()` 修饰符绘制一个以视图边缘为中心的边框，这意味着边框的一半位于视图内部，一半位于视图外部。
重要说明：这两个修饰符仅适用于形状–您可以将 `stroke()` 和 `strokeBorder()` 与 `Circle`，`Rectangle`，`Capsule`等一起使用，而不能与 `Text`，`Image` 或其他非形状视图一起使用。 如果要在非形状视图周围绘制边框，则应改用 `border()` 修饰符-请参见[“如何在视图周围绘制边框”](../demo4)。

如果您想查看一下 `strokeBorder()` ，请尝试以下操作：

```swift
Circle()
    .strokeBorder(Color.blue, lineWidth: 50)
    .frame(width: 200, height: 200)
    .padding()        
```

因为它使用 `strokeBorder()`，所以将在圆内完全绘制50点蓝色笔触。

如果您不太确定与 `stroke()` 的区别，请尝试将代码更改为此：

```swift
Circle()
    .stroke(Color.blue, lineWidth: 50)
    .frame(width: 200, height: 200)
    .padding()
```

现在，您会看到圆圈看起来更大，因为笔划(stroke)是在圆圈的一半内和一半之外绘制的。