如何绘制自定义路径？
----

`SwiftUI` 允许我们通过遵循 `Shape` 协议来绘制自定义路径，因此我们可以创建自己的形状，这些形状的作用与`Rectangle`，`Capsule` 和 `Circle` 相同。 遵守此协议并不难，因为您所要做的就是支持一个接受 `CGRect` 并返回 `Path` 的 `path(in:)` 方法。 更好的是，您可以使用以前使用 `CGPath` 或 `UIBezierPath` 构建的任何路径，然后将结果转换为 `SwiftUI` 路径。

如果您想使用 `SwiftUI` 的本机 `Path` 类型，请为其创建一个变量实例，然后根据需要添加任意数量的点或形状。 不用考虑颜色，填充或笔划宽度-您将注意力集中在原始形状上，使用自定义路径时会提供这些设置。

例如，我们可以通过绘制一系列缩小的正方形，然后将该形状放置到带有笔触和大小的SwiftUI视图中来产生创造性的效果：

```swift
struct ShrinkingSquares: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        for i in stride(from: 1, through: 100, by: 5.0) {
            let rect = CGRect(x: 0, y: 0, width: rect.width, height: rect.height)
            let insetRect = rect.insetBy(dx: CGFloat(i), dy: CGFloat(i))
            path.addRect(insetRect)
        }
        return path
    }
}

struct ContentView: View {
    var body: some View {
        ShrinkingSquares()
            .stroke()
            .frame(width: 200, height: 200)
    }
}
```