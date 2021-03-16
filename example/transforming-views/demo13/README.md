如何调整视图的不透明度？
----

使用 `opacity()` 修饰符，任何 `SwiftUI` 视图都可以部分或全部透明。 就像 `UIKit` 中 `UIView` 的 `alpha` 属性一样，它接受介于0（完全不可见）和1（完全不透明）之间的值。

例如，这将创建一个具有红色背景的文本视图，然后为其提供 `30％` 的不透明度：

```swift
Text("Now you see me")
    .padding()
    .background(Color.red)
    .opacity(0.3)
```

修改不透明度非常快-当然，您可以根据需要经常执行某些操作。 为了说明这一点，下面的代码使用滑块调整了文本的不透明度，您将看到您可以在不影响性能的情况下快速，随意地移动它：

```swift
struct ContentView: View {
    @State private var opacity = 0.5

    var body: some View {
        VStack {
            Text("Now you see me")
                .padding()
                .background(Color.red)
                .opacity(opacity)

            Slider(value: $opacity, in: 0...1)
                .padding()
        }
    }
}
```