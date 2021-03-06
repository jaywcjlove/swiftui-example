什么是 `@State` 属性包装器？
===

SwiftUI 使用 `@State` 属性包装器允许我们修改结构体中的值，由于结构体是值类型，通常不允许这样做。

当我们将 `@State` 放在属性之前时，我们有效地将其存储从结构中移出，并移到 `SwiftUI` 管理的共享存储中。 这意味着SwiftUI可以在需要时销毁并重新创建我们的结构（这可能会发生很多！），而不会丢失其存储的状态。

`@State` 应该与简单的结构类型（例如`String`，`Int`和数组）一起使用，并且通常不应与其他视图共享。 如果要在视图之间共享值，则可能应该使用 `@ObservedObject` 或 `@EnvironmentObject` - 两者都将确保在数据更改时刷新所有视图。

为了增强 `@State` 属性的本地性，`Apple` 建议您将其标记为私有，如下所示：

```swift
@State private var username = ""
```

这不是必需的，但似乎是明智的做法。

提示：如果需要，您可以使用 `@State` 跟踪引用类型，只是在引用类型更改时不会收到通知。 这对于不符合 `ObservableObject` 协议的类特别有用。