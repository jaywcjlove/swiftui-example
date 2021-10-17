如何隐藏和显示状态栏？
===

我们可以使用SwiftUI `statusBar()` 修饰符隐藏和显示 iOS 状态栏。 这需要一个隐藏参数，该参数必须为 `true` 或 `false`，具体取决于您想要的行为：

```swift
Text("No status bar, please")
    .statusBar(hidden: true)
```

⚠️ 重要：此修饰符仅在iOS上可用。

如果您希望状态栏的可见性取决于某些程序状态，请使用 `@State` 布尔值来代替硬编码值。 例如，这创建了一个 `hideStatusBar` 布尔值，当点击一个按钮时会切换该布尔值，而布尔值又控制着状态栏是否显示：

```swift
struct ContentView: View {
    @State private var hideStatusBar = false

    var body: some View {
        Button("Toggle Status Bar") {
            withAnimation {
                hideStatusBar.toggle()
            }
        }
        .statusBar(hidden: hideStatusBar)
    }
}
```

如您所见，这会在 `withAnimation` 块内切换布尔值，这会使状态栏平滑地淡入和淡出。