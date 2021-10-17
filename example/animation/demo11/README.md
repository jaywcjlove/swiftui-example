如何创建自定义过渡？
===

尽管SwiftUI内置了多种选择，但如果我们愿意，也可以编写完全自定义的转变。

该过程分三个步骤：

1. 创建一个 `ViewModifier` 来表示您处于任何状态的过渡。
2. 创建一个 `AnyTransition` 扩展，将您的视图修饰符用于活动状态和身份状态。
3. 使用 `transition()` 修饰符将该过渡应用于视图。

例如，我们可以编写形状和视图修改器组合，以模仿 `Keynote` 中的 `Iris` 动画-它使新的幻灯片出现在向上增长的圆圈中，有点像旧的`Looney Tunes` 简介序列。

为了演示这一点，我将向您展示一个完整的代码示例，该示例执行以下操作：

1. 定义 `ScaledCircle` 形状，该形状在根据某些可动画化数据进行缩放的矩形内部创建一个圆。
2. 创建一个自定义 `ViewModifier` 结构，以将任何形状（在我们的示例中为缩放圆）应用为另一个视图的剪辑形状。
3. 将其包装在 `AnyTransition` 扩展中，以将该修饰符包装在过渡中，以便于访问。
4. 创建一个 `SwiftUI` 视图以演示我们的过渡过程。

这是代码，并附有注释以说明发生了什么：

```swift
struct ScaledCircle: Shape {
    // 这可控制绘图矩形内部的圆的大小。 
    // 值为0时，圆圈是不可见的；
    // 值为1时，圆圈将填充矩形。
    var animatableData: CGFloat

    func path(in rect: CGRect) -> Path {
        let maximumCircleRadius = sqrt(rect.width * rect.width + rect.height * rect.height)
        let circleRadius = maximumCircleRadius * animatableData

        let x = rect.midX - circleRadius / 2
        let y = rect.midY - circleRadius / 2

        let circleRect = CGRect(x: x, y: y, width: circleRadius, height: circleRadius)

        return Circle().path(in: circleRect)
    }
}

// 可以使用任何形状剪切任何视图的常规修改器。
struct ClipShapeModifier<T: Shape>: ViewModifier {
    let shape: T

    func body(content: Content) -> some View {
        content.clipShape(shape)
    }
}

// 结合了 ScaledCircle 和 ClipShapeModifier 的自定义过渡。
extension AnyTransition {
    static var iris: AnyTransition {
        .modifier(
            active: ClipShapeModifier(shape: ScaledCircle(animatableData: 0)),
            identity: ClipShapeModifier(shape: ScaledCircle(animatableData: 1))
        )
    }
}

// 使用我们的转场显示和隐藏红色矩形的示例视图移动。
struct ContentView: View {
    @State private var isShowingRed = false

    var body: some View {
        ZStack {
            Color.blue
                .frame(width: 200, height: 200)

            if isShowingRed {
                Color.red
                    .frame(width: 200, height: 200)
                    .transition(.iris)
                    .zIndex(1)
            }
        }
        .padding(50)
        .onTapGesture {
            withAnimation(.easeInOut) {
                isShowingRed.toggle()
            }
        }
    }
}
```