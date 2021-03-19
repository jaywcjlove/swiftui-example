如何使用 `ProgressView` 显示不确定的进度？
---

SwiftUI 的 `ProgressView` 可以在不附加任何类型的绑定的情况下创建，这将使它们变得不确定-它们将显示一个永久设置动画的微调器，而不是显示某种清晰的进度。

它所需要的只是这样的代码：

```swift
struct ContentView: View {
    var body: some View {
        ProgressView("Downloading…")
    }
}
```