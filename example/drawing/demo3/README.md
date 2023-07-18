如何绘制多边形和星星？
===

了解 SwiftUI 的基本路径绘制系统后，即可轻松添加各种形状。 例如，我们可以创建一个仅需少量数学就可以表示各种星形甚至其他多边形的星形。

代码中的代码如下：

```swift
struct Star: Shape {
    // 储存恒星有多少个角，以及它有多光滑/尖锐
    let corners: Int
    let smoothness: CGFloat

    func path(in rect: CGRect) -> Path {
        // 确保我们至少有两个角，否则请发送空路径
        guard corners >= 2 else { return Path() }

        // 从矩形的中心绘制
        let center = CGPoint(x: rect.width / 2, y: rect.height / 2)

        // 从直接向上开始（与向下或向右相反）
        var currentAngle = -CGFloat.pi / 2

        // 计算每个星形角落需要移动多少。
        let angleAdjustment = .pi * 2 / CGFloat(corners * 2)

        // 计算星形的内部点需要在X和Y方向上移动多少。
        let innerX = center.x * smoothness
        let innerY = center.y * smoothness

        // 我们现在准备好开始绘制路径了。
        var path = Path()

        // 移动到我们的初始位置。
        path.move(to: CGPoint(x: center.x * cos(currentAngle), y: center.y * sin(currentAngle)))

        // 跟踪我们绘制的最低点，以便稍后进行居中处理。
        var bottomEdge: CGFloat = 0

        // 循环遍历所有的点/内部点。
        for corner in 0..<corners * 2  {
            // 确定该点的位置。
            let sinAngle = sin(currentAngle)
            let cosAngle = cos(currentAngle)
            let bottom: CGFloat

            // 如果我们是2的倍数，那么我们正在绘制星形的外边缘。
            if corner.isMultiple(of: 2) {
                // 保存这个 Y 位置
                bottom = center.y * sinAngle

                // ...并添加一条线到那里。
                path.addLine(to: CGPoint(x: center.x * cosAngle, y: bottom))
            } else {
                // 我们不是2的倍数，这意味着我们正在绘制一个内部点。

                // 保存这个 Y 位置
                bottom = innerY * sinAngle

                // ...并添加一条线到那里。
                path.addLine(to: CGPoint(x: innerX * cosAngle, y: bottom))
            }

            // 如果这个新的底部点是我们最低的点，将其保存供以后使用。
            if bottom > bottomEdge {
                bottomEdge = bottom
            }

            // 继续下一个角落。
            currentAngle += angleAdjustment
        }

        // 计算我们绘图矩形底部剩余的未使用空间。
        let unusedSpace = (rect.height / 2 - bottomEdge) / 2

        // 创建并应用一个变换，将我们的路径向下移动相应的距离，垂直居中形状。
        let transform = CGAffineTransform(translationX: center.x, y: center.y + unusedSpace)
        return path.applying(transform)
    }
}

struct ContentView: View {
    var body: some View {
        Star(corners: 5, smoothness: 0.45)
            .fill(Color.red)
            .frame(width: 200, height: 200)
            .background(Color.green)

    }
}
```
