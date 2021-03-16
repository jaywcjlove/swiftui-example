如何创建显式动画？
----

如果将动画修改器附加到视图，则最终会得到隐式动画-即使只是增加整数或切换布尔值，更改视图其他位置的某些状态也可能会使用动画。

一种替代方法是使用显式动画，在这种情况下，您无需在相关视图上附加修饰符，而是要求 `SwiftUI` 为要进行的精确更改设置动画。 为此，请将您的更改包装在对 `withAnimation()` 的调用中。

例如，它使用显式动画使按钮每次被点击时稍微消失一些：

```swift
struct ContentView: View {
    @State private var opacity = 1.0

    var body: some View {
        Button("Press here") {
            withAnimation {
                opacity -= 0.2
            }
        }
        .padding()
        .opacity(opacity)
    }
}
```

`withAnimation()` 使用一个参数来指定所需的动画类型，因此您可以创建一个三秒钟的线性动画，如下所示：`withAnimation(.linear(duration：3))`

显式动画通常很有用，因为它们会导致动画的每个受影响的视图，而不仅仅是附加了隐式动画的视图。 例如，如果 `视图A` 作为动画的一部分必须为 `视图B` 腾出空间，但是只有 `视图B` 附加了动画，那么除非您使用显式动画，否则视图A将跳到其新位置而不进行动画处理。