如何检测“减少运动”辅助功能设置？
===

许多用户对动画敏感，尤其是那些大型或复杂的动画。 因此，iOS具有名为“减少运动”(Reduce Motion)的内置可访问性设置，应用可以根据需要对其进行读取和响应。

在 SwiftUI 中，此设置作为环境布尔值公开给我们，因此您应该首先在视图中添加一个属性：

```swift
@Environment(\.accessibilityReduceMotion) var reduceMotion
```

现在由您决定 “reduce motion” 的含义 – 是删除动画，还是只是将动画更改为强度较小？ 您是否应该保留一些重要的动画，而只删除那些具有视觉吸引力的动画？

例如，如果您想为大多数用户提供弹性的弹簧动画，但对于希望减少运动的用户则根本不需要动画，则可以使用如下所示的动画修改器：

```swift
.animation(reduceMotion ? nil : .spring(response: 1, dampingFraction: 0.1)) 
```

这是一个完整的示例，您可以尝试：

```swift
struct ContentView: View {
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    @State private var scale: CGFloat = 1

    var body: some View {
        VStack {
            Spacer()

            Circle()
                .frame(width: 20, height: 20)
                .scaleEffect(scale)
                .animation(reduceMotion ? nil : .spring(response: 1, dampingFraction: 0.1))

            Spacer()

            Button("Increase Scale") {
                scale *= 1.5
            }
        }
    }
}
```

这将创建一个小矩形，每次按下该按钮时，将使用弹簧动画将其放大。 但是，如果用户启用了减少运动，则动画将被完全删除 – 它对 `animation()` 修饰符使用 `nil`。
