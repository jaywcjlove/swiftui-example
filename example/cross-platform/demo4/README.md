如何使用 `digitalCrownRotation()` 在 `watchOS` 上读取 `Digital Crown`？
===

![Updated for Xcode 13.0](https://img.shields.io/static/v1?label=&message=Updated%20for%20Xcode%2013.0&color=success&logo=Xcode&logoColor=white)
![New in watchOS 8](https://img.shields.io/static/v1?label=&message=New%20in%20watchOS%207&color=lightgrey&logo=apple)

`SwiftUI` 通过两个修饰符向我们的应用程序公开数字表冠，必须同时使用这两个修饰符才能将表冠用作我们应用程序的输入。 第一个是 `focusable()`，当您希望有问题的视图能够接收 `Digital Crown` 更新时，它应该为 `true`，而 `digitalCrownRotation()` 则在 `Digital Crown` 和您选择的属性之间创建绑定。

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

https://wangchujiang.com/swiftui-example/example/cross-platform/demo4/01.mp4

这将从负无穷大滚动到正无穷大，在文本视图中显示当前滚动值。

提示：如果将 `focusable()` 放在 `digitalCrownRotation()` 之后，您会发现它不再起作用。

`digitalCrownRotation()` 修饰符有几种其他形式，可以让您更好地控制其行为方式。 例如，最长的品种让我们：

这将从负无穷大滚动到正无穷大，在文本视图中显示当前滚动值。

提示：如果将 `focusable()` 放在 `digitalCrownRotation()` 之后，您会发现它不再起作用。

`digitalCrownRotation()` 修饰符还具有其他两种形式，可让您更好地控制其行为。 例如，最长的品种使我们：

1. `from` 和 `through` 设置滚动范围。
2. `by` 设置步进量，控制每次表冠转动时改变多少。
3. `sensitivity` 决定了表冠需要移动多少才能触发变化。
4. `isContinuous` 确定该值在达到最小值或最大值时是否回绕，或者是否仅在这些边界处停止。
5. `isHapticFeedbackEnabled` 确定是否在转弯时触发触觉反馈。

例如，此修改器以 `0.1` 的增量从 `1` 到 `5` 步进，灵敏度较低，从头到尾环绕，带有触觉反馈：

```swift0
.digitalCrownRotation($scrollAmount, from: 1, through: 5, by: 0.1, sensitivity: .low, isContinuous: true, isHapticFeedbackEnabled: true)
```

https://wangchujiang.com/swiftui-example/example/cross-platform/demo4/02.mp4