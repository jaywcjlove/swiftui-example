如何在一个视图中应用多个动画？
===

我们使用 `SwiftUI` 的 `animation()` 修饰符的顺序会影响要对哪些修饰符进行动画处理，还可以添加多个 `animation()` 修饰符以获取不同的动画。

例如，我们可以编写代码来创建一个在启用状态和禁用状态之间进行动画处理的按钮，从而对圆角和背景颜色进行更改。 如果我们希望为圆角动画而不是改变颜色，请在剪辑形状之后使用诸如 `animation(.default)`之类的动画，然后在背景之后使用 `animation(nil)` 之类的动画：

```swift
struct ContentView: View {
    @State private var isEnabled = false

    var body: some View {
        Button("Press Me") {
            isEnabled.toggle()
        }
        .foregroundColor(.white)
        .frame(width: 200, height: 200)
        .background(isEnabled ? Color.green : Color.red)
        .animation(nil)
        .clipShape(RoundedRectangle(cornerRadius: isEnabled ? 100 : 0))
        .animation(.default)
    }
}
```

使用此技术，可以根据需要对每个修改器进行不同的动画处理。