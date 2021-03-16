如何绘制多边形和星星？
----

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

        // start from directly upwards (as opposed to down or to the right)
        var currentAngle = -CGFloat.pi / 2

        // calculate how much we need to move with each star corner
        let angleAdjustment = .pi * 2 / CGFloat(corners * 2)

        // figure out how much we need to move X/Y for the inner points of the star
        let innerX = center.x * smoothness
        let innerY = center.y * smoothness

        // we're ready to start with our path now
        var path = Path()

        // move to our initial position
        path.move(to: CGPoint(x: center.x * cos(currentAngle), y: center.y * sin(currentAngle)))

        // track the lowest point we draw to, so we can center later
        var bottomEdge: CGFloat = 0

        // loop over all our points/inner points
        for corner in 0..<corners * 2  {
            // figure out the location of this point
            let sinAngle = sin(currentAngle)
            let cosAngle = cos(currentAngle)
            let bottom: CGFloat

            // if we're a multiple of 2 we are drawing the outer edge of the star
            if corner.isMultiple(of: 2) {
                // store this Y position
                bottom = center.y * sinAngle

                // …and add a line to there
                path.addLine(to: CGPoint(x: center.x * cosAngle, y: bottom))
            } else {
                // we're not a multiple of 2, which means we're drawing an inner point

                // store this Y position
                bottom = innerY * sinAngle

                // …and add a line to there
                path.addLine(to: CGPoint(x: innerX * cosAngle, y: bottom))
            }

            // if this new bottom point is our lowest, stash it away for later
            if bottom > bottomEdge {
                bottomEdge = bottom
            }

            // move on to the next corner
            currentAngle += angleAdjustment
        }

        // figure out how much unused space we have at the bottom of our drawing rectangle
        let unusedSpace = (rect.height / 2 - bottomEdge) / 2

        // create and apply a transform that moves our path down by that amount, centering the shape vertically
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