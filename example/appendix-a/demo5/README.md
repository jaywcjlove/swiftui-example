什么是 `@Published` 属性包装器？
===

`@Published` 是 `SwiftUI` 中最有用的属性包装器之一，它使我们能够创建可观察的对象，这些对象会在发生更改时自动宣布。 `SwiftUI` 将自动监视此类更改，并重新调用所有依赖于数据的视图的 `body` 属性。

实际上，这意味着只要更改带有标记为 `@Published` 的属性的对象，就会重新加载使用该对象的所有视图以反映这些更改。

例如，如果我们有一个这样的可观察对象：

```swift
class Bag: ObservableObject {
    var items = [String]()
}
```

这符合 `ObservableObject` 协议，这意味着 `SwiftUI` 的视图可以监视它的更改。 但是，由于它的唯一属性未标记为 `@Published`，因此不会发送任何更改通知-您可以将项目自由添加到数组中，而视图也不会更新。

如果您希望每当添加或删除项目时都发送变更公告，则可以使用 `@Published` 进行标记，如下所示：

```swift
class Bag: ObservableObject {
    @Published var items = [String]()
}
```

您无需执行其他任何操作 - `@Published` 属性包装器可以有效地将 `willSet` 属性观察者添加到项目中，这样任何更改都会自动发送给观察者。

如您所见，`@Published` 是选择加入的–您需要列出应该引起公告的属性，因为默认情况下，更改不会导致重新加载。 这意味着您可以拥有存储缓存的属性，供内部使用的属性等，并且它们不会强制 `SwiftUI` 在更改视图时重新加载视图，除非您用 `@Published` 专门标记它们。

