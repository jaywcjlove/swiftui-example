如何为绑定值的变化制作动画？
----

SwiftUI的双向绑定使我们可以调整程序的状态，并且可以通过调整视图层次结构来对此做出响应。 例如，我们可能使某些文本出现或消失，或者调整视图的不透明度。

除了可以立即进行状态更改外，我们还可以对绑定进行动画处理，方法是通过向其绑定中添加 `animation()` 来修改绑定。 例如，此视图具有一个切换，该切换根据切换的阶段显示或隐藏文本视图：

```swift
struct ContentView: View {
    @State private var showingWelcome = false
    var body: some View {
        VStack {
            Toggle("Toggle label", isOn: $showingWelcome)
            if showingWelcome {
                Text("Hello World")
            }
        }
    }
}
```

没有动画，文本视图将立即出现或消失，从而导致视觉跳转。 如果我们修改切换开关，使其绑定到 `$showingWelcome.animation()`，则文本视图将平滑滑动：

```swift
struct ContentView: View {
    @State private var showingWelcome = false

    var body: some View {
        VStack {
            Toggle("Toggle label", isOn: $showingWelcome.animation())

            if showingWelcome {
                Text("Hello World")
            }
        }
    }
}
```

如果要对动画进行更多控制，可以将参数传递给 `animation()`，这些参数会影响过渡的发生方式。 例如，这将使文本带有一个简单的 `spring` 动画：`$showingWelcome.animation(.spring())`。