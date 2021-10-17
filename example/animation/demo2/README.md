如何制作弹簧动画？
===

`SwiftUI` 内置了对春季动画的支持，这些动画会移动到目标点，过冲一些然后反弹。

如果仅使用 `.spring()` 而不使用任何参数，则会得到一个明智的默认值。 因此，这将创建一个 `Spring` 动画，每次点击按钮会将按钮旋转45度：

```swift
struct ContentView: View {
    @State private var angle: Double = 0

    var body: some View {
        Button("Press here") {
            angle += 45
        }
        .padding()
        .rotationEffect(.degrees(angle))
        .animation(.spring())
    }
}
```

如果您想对弹簧动画进行细粒度的控制，请输入您感兴趣的任何参数：物体的质量，弹簧的刚度，弹簧减慢的速度以及在发射时开始移动的速度 。

例如，这将创建一个具有适度弹簧阻尼的按钮，这意味着它将在达到目标角度之前来回弹跳几次：

```swift
struct ContentView: View {
    @State private var angle: Double = 0

    var body: some View {
        Button("Press here") {
            angle += 45
        }
        .padding()
        .rotationEffect(.degrees(angle))
        .animation(.interpolatingSpring(mass: 1, stiffness: 1, damping: 0.5, initialVelocity: 10))
    }
}
```

注意：这是一个插补弹簧，这意味着如果多次触发动画，则弹簧组合时，弹簧效果将越来越强。