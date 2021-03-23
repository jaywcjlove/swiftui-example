如何在请求时减少动画？
---

SwiftUI 的 `withAnimation()` 函数可让我们轻松地在视图上执行自定义动画，但它不遵守 “Reduce Motion” 可访问性设置，因此可能会使您的应用难以为许多人使用。

如果您还想使用 `withAnimation()` 并同时遵守该设置，建议您添加一个像这样的全局函数：

```swift
func withOptionalAnimation<Result>(_ animation: Animation? = .default, _ body: () throws -> Result) rethrows -> Result {
    if UIAccessibility.isReduceMotionEnabled {
        return try body()
    } else {
        return try withAnimation(animation, body)
    }
}
```
该功能会自动检查每次触发动画时是否启用了“降低运动”功能，并针对专门请求较少动画的用户将其禁用。

如果您想知道，`withAnimation()` 也是一个全局函数–该函数位于任何其他类型的外部–因此，新的 `withOptionalAnimation（）`函数的行为将相同。

因此，您可以在与 `withAnimation()` 一起使用的任何地方使用它，如下所示：

```swift
struct ContentView: View {
    @State private var scale: CGFloat = 1

    var body: some View {
        Text("Hello, World!")
            .scaleEffect(scale)
            .onTapGesture {
                withOptionalAnimation {
                    scale *= 1.5
                }
            }
    }
}
```