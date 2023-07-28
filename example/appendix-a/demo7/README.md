什么是 `@EnvironmentObject` 属性包装器？
===

SwiftUI 的 `@EnvironmentObject` 属性包装器使我们可以创建依赖共享数据的视图，这些视图通常跨整个 `SwiftUI` 应用程序。 例如，如果创建一个将在应用程序的许多部分之间共享的用户，则应使用 `@EnvironmentObject`。

例如，我们可能有一个像这样的 `Order` 类：

```swift
class Order: ObservableObject {
    @Published var items = [String]()
}
```

这符合 `ObservableObject`，这意味着我们可以将其与 `@ObservedObject` 或 `@EnvironmentObject` 一起使用。 在这种情况下，我们可以创建一个将其与 `@EnvironmentObject` 一起使用的视图，如下所示：

```swift
struct ContentView: View {
    @EnvironmentObject var order: Order

    var body: some View {
        // your code here
    }
}
```

请注意， `order` 属性没有给定默认值 - 通过使用 `@EnvironmentObject` ，我们表明该值将由 `SwiftUI` 环境提供，而不是由此视图显式创建。

`@EnvironmentObject` 与 `@ObservedObject` 有很多共同点：两者都必须引用符合 `ObservableObject` 的类，都可以在许多视图之间共享，并且都可以在发生重大更改时更新正在监视的所有视图。 但是，`@EnvironmentObject` 明确表示“此对象将由某个外部实体提供，而不是由当前视图创建或专门传递。

实际上，假设您是否拥有 `视图A`，并且`视图A`拥有`视图E`所需的一些数据。使用 `@ObservedObject`，`视图A`需要将对象传递给`视图B`，然后将其传递给`视图C`，然后传递给`视图D`，最后传递给`视图E` – 所有中间视图都需要发送给对象，即使它们实际上并没有需要它。

使用 `@EnvironmentObject` 时，`视图A`可以创建一个对象并将其放置到环境中。然后，只要需要，它内的任何视图都可以访问该环境对象，而不必显式传递它 – 这使我们的代码更加简单。

警告：显示使用 `@EnvironmentObject` 的视图时，`SwiftUI` 将立即在环境中搜索正确类型的对象。如果找不到此类对象（即，如果您忘记将其放置在环境中），则您的应用将立即崩溃。当使用 `@EnvironmentObject` 时，可以有效地保证对象在需要时会存在于环境中，这有点像使用隐式解包的可选对象。
