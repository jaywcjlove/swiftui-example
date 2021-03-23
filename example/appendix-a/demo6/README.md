什么是 `@ObservedObject` 属性包装器？
---

SwiftUI 为我们提供了 `@ObservedObject` 属性包装器，以便视图可以监视外部对象的状态，并在重要内容发生变化时得到通知。 它的行为与 `@StateObject` 相似，不同之处在于它不得用于创建对象–仅将 `@ObservableObject` 与在其他位置创建的对象一起使用，否则 SwiftUI 可能会意外破坏该对象。

例如，我们可能会使用以下内容：

```swift
class Order: ObservableObject {
    @Published var items = [String]()
}

struct ContentView: View {
    @ObservedObject var order: Order

    var body: some View {
        // your code here
    }
}
```

该 `Order` 类使用 `@Published`，因此它将在项目更改时自动发送更改公告，而 `ContentView` 使用 `@ObservedObject` 来监视那些公告。如果没有 `@ObservedObject`，则更改通知将被发送但被忽略。

尽管这看起来很简单，但值得深入探讨一些细节。

首先，用 `@ObservedObject` 标记的任何类型都必须符合 `ObservableObject` 协议，这反过来意味着它必须是类而不是结构。这不是可选的 – `SwiftUI` 要求我们在此处使用一个类。

其次，观察到的对象是专门为视图外部的数据设计的，这意味着它们可能在多个视图之间共享。 `@ObservedObject` 属性包装器将自动确保密切监视该属性，以便重要的更改将重新使用该视图加载任何视图。这也意味着必须在其他位置创建数据，然后将其发送到您的视图中。

第三，并不是观察对象中的所有属性都会导致视图刷新-您需要使用@Published或自定义公告来决定哪些属性应发送更改通知。为符合 `ObservableObject` 的类型提供默认的 `objectWillChange` 发布者，以便根据需要进行自定义声明。