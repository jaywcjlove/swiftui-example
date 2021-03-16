如何创建基本动画
----

SwiftUI 的 `animation()` 修饰符内置了对动画的支持。 要使用此修改器，请将其放置在视图的任何其他修改器之后，并告诉它所需的动画类型。

例如，这段代码创建了一个按钮，每次按下该按钮，其缩放效果就会增加1：

```swift
struct ContentView: View {
    @State private var scale: CGFloat = 1

    var body: some View {
        Button("Press here") {
            scale += 1
        }
        .scaleEffect(scale)
        .animation(.linear(duration: 1))
    }
}
```

这会使动画发生超过 `1` 秒钟，但是如果您不想为动画指定准确的时间，则可以使用 `.linear`。

除了简单的线性动画，您还可以从 `.easeIn`，`.easeOut`，`.easeInOut` 指定一条曲线，或者使用 `.timingCurve` 指定自己的控制点。

例如，这使缩放效果动画化，从而使其开始缓慢并变得更快：

```swift
struct ContentView: View {
    @State private var scale: CGFloat = 1

    var body: some View {
        Button("Press here") {
            scale += 1
        }
        .scaleEffect(scale)
        .animation(.easeIn)
    }
}
```

您可以设置许多其他修改器的动画，例如 `2D` 和 `3D` 旋转，不透明度，边框等。 例如，这使按钮每次旋转都会旋转并增加其边框：

```swift
struct ContentView: View {
    @State private var angle: Double = 0
    @State private var borderThickness: CGFloat = 1

    var body: some View {
        Button("Press here") {
            angle += 45
            borderThickness += 1
        }
        .padding()
        .border(Color.red, width: borderThickness)
        .rotationEffect(.degrees(angle))
        .animation(.easeIn)
    }
}
```