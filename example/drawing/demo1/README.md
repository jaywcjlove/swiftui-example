SwiftUI 的内置形状
===

SwiftUI 为我们提供了五个常用的内置形状：矩形(rectangle)，圆角矩形(rounded rectangle)，圆形(circle)，椭圆形(ellipse)和胶囊形(capsule)。 根据提供的尺寸，最后三个尤其在行为上有细微的差别，但是我们可以通过一个示例来演示所有选项：

```swift
struct ContentView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.black)
                .frame(width: 200, height: 200)

            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(Color.red)
                .frame(width: 200, height: 200)

            Capsule()
                .fill(Color.green)
                .frame(width: 100, height: 50)

            Ellipse()
                .fill(Color.blue)
                .frame(width: 100, height: 50)

            Circle()
                .fill(Color.white)
                .frame(width: 100, height: 50)
        }
    }
}
```

绘制所有五个形状：两个以 `200x200` 绘制，三个以 `100x50` 绘制。 但是，由于形状的绘制行为不同，因此您会在输出中看到所有五个形状：

- `Rectangle` 将按照您指定的确切尺寸绘制一个框。
- `RoundedRectangle` 的作用相同，只是现在您可以将拐角处的角度取一定数量。 它的第二个参数 `style` 决定了您要使用经典的圆角（`.circular`）还是 Apple 稍微更平滑的替代(`.continuous`)。
- `Capsule` 绘制一个盒子，其中一个边缘轴完全变圆，具体取决于高度或宽度最大。 我们的形状是 `100x50`，因此它的左右边缘将变圆，而上边缘和下边缘则笔直。
- `Ellipse` 以您指定的确切尺寸绘制椭圆。
- `Circle` 绘制的椭圆的高度和宽度相等，因此当我们为空间提供100x50时，实际上将得到 `50x50`。