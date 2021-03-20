如何使用 `digitalCrownRotation()` 在 `watchOS` 上读取 `Digital Crown`？
---

SwiftUI 通过两个修饰符将 `Digital Crown` 公开给我们的应用程序，必须同时使用两个修饰符才能将 `Crown` 用作我们应用程序的输入。 第一个是 `focusable()`，当您希望相关视图能够接收 `Digital Crown` 更新时，它应该为 `true`；以及 `digitalCrownRotation()`，它在 `Digital Crown` 和您选择的属性之间创建绑定。

这是一个简单的示例，可帮助您入门：

```swift
struct ContentView: View {
    @State var scrollAmount = 0.0

    var body: some View {
        Text("Scroll: \(scrollAmount)")
            .focusable(true)
            .digitalCrownRotation($scrollAmount)
    }
}
```

这将从负无穷大滚动到正无穷大，在文本视图中显示当前滚动值。

提示：如果将 `focusable()` 放在 `digitalCrownRotation()` 之后，您会发现它不再起作用。

`digitalCrownRotation()` 修饰符还具有其他两种形式，可让您更好地控制其行为。 例如，最长的品种使我们：

1. 设置滚动范围。
2. 通过设置步进量，控制每次旋转表冠时改变的数量
3. 灵敏度决定需要移动多少柄头以触发更改
4. `isContinuous` 确定值达到最小值或最大值时是否回绕，还是仅在这些边界处停止。
5. `isHapticFeedbackEnabled` 确定是否在转弯时触发触觉反馈。

例如，此修饰符从 `1` 到 `5` 以 `0.1` 的增量逐步移动，并且灵敏度较低，从头到尾都环绕着，并带有触觉反馈：

```swift
.digitalCrownRotation($scrollAmount, from: 1, through: 5, by: 0.1, sensitivity: .low, isContinuous: true, isHapticFeedbackEnabled: true)
```