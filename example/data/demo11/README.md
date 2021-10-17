如何在 `SwiftUI` 中继续 `NSUserActivity`？
===

SwiftUI 具有专用的 `onContinueUserActivity()`修饰符，可以捕获各种 `NSUserActivity` 类型 - 从 Web 单击，从 `Spotlight` 或 `Siri` 启动等等。 以前，您可能使用诸如 `application(_:continue: restorationHandler :)` 之类的东西在 `AppDelegate` 中进行了处理，但是 `SwiftUI` 的方法更细粒度，使我们可以更轻松地划分功能。

要实现此目的，请首先创建一个将接受 `NSUserActivity` 的函数。 您无需在 `App` 结构中执行此操作，但是这样做很有意义，因为您可以在程序的其余部分中将其路由到任何需要的地方。

例如，此函数检查是否从 `Spotlight` 中传入了我们的数据，如果是，则提取出唯一标识符，以便您可以在数据源中查找它：

```swift
func handleSpotlight(_ userActivity: NSUserActivity) {
    if let id = userActivity.userInfo?[CSSearchableItemActivityIdentifier] as? String {
        print("Found identifier \(id)")
    }
}
```

注意：不需要检查 `activityType` 属性，因为它将在我们的下一个代码中由 `SwiftUI` 过滤。

现在，您可以像这样修改 `App` 结构，将其附加到主应用的视图中：

```swift
WindowGroup {
    ContentView()
        .onContinueUserActivity(CSSearchableItemActionType, perform: handleSpotlight)
}
```

当然，这仅仅是处理用户活动的基本要素 – 您已经检测到该活动并且您的代码已运行，但是现在您需要以某种方式完成响应该事件的实际工作。

如果不确定从哪里开始，则可能应该使 `handleSpotlight()` 在驱动UI的程序中设置一些共享状态，例如导致显示详细视图。