如何在SwiftUI中使用计时器？
----

如果要定期运行某些代码（例如制作倒数计时器或类似的计时器），则应使用 `Timer` 和 `onReceive()` 修饰符。

例如，此代码创建一个计时器发布程序，该计时器每秒触发一次，并使用当前时间更新标签：

```swift
struct ContentView: View {
    @State var currentDate = Date()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        Text("\(currentDate)")
            .onReceive(timer) { input in
                currentDate = input
            }
    }
}
```

将 `.main` 用作 `runloop` 选项非常重要，因为我们的计时器会更新用户界面。 至于 `.common` 模式，它允许计时器与其他常见事件一起运行-例如，如果文本在滚动的滚动视图中。

如您所见，`onReceive()` 闭包在包含当前日期的某些输入中传递。 在上面的代码中，我们直接将其分配给 `currentDate`，但是您可以使用它来计算自上一个日期以来经过了多少时间。

如果您特别想创建一个倒数计时器或秒表，则应创建某种状态来跟踪剩余时间，然后在计时器启动时从中减去。

例如，我们可以创建一个倒数计时器，以显示标签中剩余的时间，如下所示：


```swift
struct ContentView: View {
    @State var timeRemaining = 10
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        Text("\(timeRemaining)")
            .onReceive(timer) { _ in
                if timeRemaining > 0 {
                    timeRemaining -= 1
                }
            }
            .padding(100)
            .frame(width: 300)
    }
}
```