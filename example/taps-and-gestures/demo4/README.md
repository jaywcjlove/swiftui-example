如何使用 `simultaneousGesture()` 同时识别两个手势？
===

默认情况下，`SwiftUI` 一次只会触发一个手势识别器动作，通常是您层次结构中最前面的视图中的任何一个 - 例如，它倾向于在子视图而不是其父视图上使用识别器。 如果要覆盖此行为以一次触发两个手势，则在创建第二个手势和后续手势时应使用 `sameGesture()`。

例如，在这段代码中，我们有两个轻击手势，但是 `SwiftUI` 仅执行附加到圆圈上的一个手势，因为它是 `VStack` 的子代：

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Circle()
                .fill(Color.red)
                .frame(width: 200, height: 200)
                .onTapGesture {
                    print("Circle tapped")
                }
        }
        .onTapGesture {
            print("VStack tapped")
        }
    }
}
```

如果要同时触发两个手势（即，如果要同时打印 `Circle tapped` 和 `VStack tapped`），则应在 `VStack` 上同时使用 `Gesture()`，如下所示：

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Circle()
                .fill(Color.red)
                .frame(width: 200, height: 200)
                .onTapGesture {
                    print("Circle tapped")
                }
        }
        .simultaneousGesture(
            TapGesture()
                .onEnded { _ in
                    print("VStack tapped")
                }
        )
    }
}
```

注意：您应该将 `simultaneousGesture()` 与不会执行的手势一起使用，否则它将无法正常工作。 因此，在我们之前的示例中，同时使用带有圆圈的并发 `Gesture()` 和带有 `VStack` 的简单 `onTapGesture()` 仍将仅打印 `Circle tapped`（圆环点击），这将无法实现您的期望。
