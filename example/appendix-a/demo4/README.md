什么是 `@StateObject` 属性包装器？
===

SwiftUI 的 `@StateObject` 属性包装器旨在填补状态管理中的一个非常具体的空白：当您需要在其中一个视图中创建引用类型并确保该类型在该视图以及与之共享的其他视图中仍然有效时，就可以使用。

例如，考虑一个简单的 `User` 类，例如：

```swift
class User: ObservableObject {
    var username = "@twostraws"
}
```

如果要在各种视图中使用它，则需要在 `SwiftUI` 外部创建它并将其注入，或者在其中一个 `SwiftUI` 视图中创建它并使用 `@StateObject`，如下所示：

```swift
struct ContentView: View {
    @StateObject var user = User()

    var body: some View {
        Text("Username: \(user.username)")
    }
}
```

这将确保视图更新时不会破坏 `User` 实例。

以前，您可能曾经使用 `@ObservedObject` 来获得相同的结果，但这很危险–有时且仅在某些情况下，`@ObservedObject` 可能会意外释放其存储的对象，因为它并不是被设计为最终的真理来源。 目的。 `@StateObject` 不会发生这种情况，因此您应该改用它。

重要说明：每个对象只能使用 `@StateObject` 一次，无论在哪个视图中创建对象都应使用 `@StateObject`。 共享对象的所有其他视图应使用`@ObservedObject`。