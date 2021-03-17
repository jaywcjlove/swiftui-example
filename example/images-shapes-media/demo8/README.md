

SwiftUI 提供了 `fill()`，`stroke()` 和 `strokeBorder()` 修饰符，用于调整绘制图形的方式，但它并未提供内置的填充和描边方式。 但是，我们可以通过两种不同的方式获得相同的效果，在这里我将向大家展示。

第一种选择是使用 `strokeBorder()` 在形状周围添加边框，然后使用 `background()` 在背景中放置填充的形状。 例如，这将创建一个带有黑色笔划和蓝色填充的圆：


```swift
Circle()
    .strokeBorder(Color.black, lineWidth: 20)
    .background(Circle().fill(Color.blue))
    .frame(width: 150, height: 150)
```

使用 `background()` 可确保蓝色圆圈始终与红色圆圈的大小匹配。

第二个选择是使用ZStack手动将两个圆圈分层：

```swift
ZStack {
    Circle()
        .fill(Color.red)

    Circle()
        .strokeBorder(Color.black, lineWidth: 20)
}
.frame(width: 150, height: 150)
```


如果要填充和描边很多形状，则应考虑将此功能包装在扩展中。 只有 `InsettableShapes` 才能获取 `strokeBorder()` 方法，因此您可能应该编写两种扩展方法 - 一种使用 `stroke()` 处理常规形状，另一种使用 `strokeBorder()` 处理可嵌入形状。

这就是代码中的样子：

```swift
extension Shape {
    func fill<Fill: ShapeStyle, Stroke: ShapeStyle>(_ fillStyle: Fill, strokeBorder strokeStyle: Stroke, lineWidth: CGFloat = 1) -> some View {
        self
            .stroke(strokeStyle, lineWidth: lineWidth)
            .background(self.fill(fillStyle))
    }
}

extension InsettableShape {
    func fill<Fill: ShapeStyle, Stroke: ShapeStyle>(_ fillStyle: Fill, strokeBorder strokeStyle: Stroke, lineWidth: CGFloat = 1) -> some View {
        self
            .strokeBorder(strokeStyle, lineWidth: lineWidth)
            .background(self.fill(fillStyle))
    }
}
```