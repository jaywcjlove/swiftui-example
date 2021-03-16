如何将视图融合在一起？
----

将一个视图放在另一个视图上时，可以使用 `blendMode()` 修饰符控制它们的重叠方式。 这包含多种将颜色混合在一起的方法，例如使用它们的差异或使用颜色加深-如果您以前使用过 `Core Graphics` 或类似 `Photoshop` 的工具，那么这些方法将会很熟悉。

为了演示这一点，我们可以创建一个内部有两个重叠圆的 `ZStack`，其中第二个圆具有 `.multiply` 混合模式，以使其背后的颜色变暗：

```swift
ZStack {
    Circle()
        .fill(Color.red)
        .frame(width: 200, height: 200)
        .offset(x: -50)
        .blendMode(.screen)

    Circle()
        .fill(Color.blue)
        .frame(width: 200, height: 200)
        .offset(x: 50)
        .blendMode(.screen)
}
.frame(width: 400)
```