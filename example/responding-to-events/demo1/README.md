如何使用 `scenePhase` 检测您的应用何时移至背景或前景？
===

现在，您可以向自己的身体添加任何逻辑，或者使用 `onChange()` 直接观察变化。

作为示例，我们可以编写一个视图来监视 `scenePhase` 并在阶段更改时将一些文本输出到 `Xcode` 的调试控制台中：

```swift
struct ContentView: View {
    @Environment(\.scenePhase) var scenePhase

    var body: some View { 
        Text("Example Text")
            .onChange(of: scenePhase) { newPhase in
                if newPhase == .inactive {
                    print("Inactive")
                } else if newPhase == .active {
                    print("Active")
                } else if newPhase == .background {
                    print("Background")
                }
            }
    }
}
```

如您所见，存在三种状态：

1. 当您的应用位于前台并与用户进行交互时，将使用“活动”状态，这意味着他们现在正在使用它。
2. 当您的应用当前不可见时，将使用“背景”状态，因此您应减少工作量。
3. 当您的应用可见但未与用户直接交互时，将使用“非活动”状态。 例如，如果您在运行应用程序时进入多任务处理模式–您可以在其他窗口旁边看到您的应用程序窗口，但您并未直接使用它。