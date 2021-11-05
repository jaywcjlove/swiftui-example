如何查找导致 SwiftUI 视图更新的数据更改？
===

![Updated for Xcode 13](https://img.shields.io/static/v1?label=&message=Updated%20for%20Xcode%2013.1&color=blue&logo=Xcode&logoColor=white)
![New in iOS 15](https://img.shields.io/static/v1?label=&message=New%20in%20iOS%2015&color=lightgrey&logo=apple)

`SwiftUI` 提供了一个特殊的、仅用于调试的方法调用，我们可以使用它来识别导致视图重新加载自身的更改。该方法专门用于调试，不应在真正的应用程序中提供，但是当您看到视图正在重新调用其 `body` 属性但您不确定为什么时，它非常有用。

该方法是 `Self._printChanges()`，应该在 `body` 属性中调用。 这意味着您将暂时需要添加显式返回来发送回您的常规视图代码。

为了演示此方法的实际应用，以下是一些示例代码，其中视图依赖于随机发出更改通知的可观察对象：

```swift
class EvilStateObject: ObservableObject {
  var timer: Timer?

  init() {
    timer = Timer.scheduledTimer(
      withTimeInterval: 1,
      repeats: true
    ) { _ in
      if Int.random(in: 1...5) == 1 {
          self.objectWillChange.send()
      }
    }
  }
}

struct ContentView: View {
  @StateObject private var evilObject = EvilStateObject()
  var body: some View {
    print(Self._printChanges())
    return Text("What could possibly go wrong?")
  }
}
```

https://user-images.githubusercontent.com/1680273/140460379-3341d938-f7ef-432d-b773-1a0d9d960c5e.mp4

[`Peter Steinberger`](https://twitter.com/steipete/status/1379483193708052480) 有一个有用的提示，用于发现视图的 `body` 属性何时被重新调用：为其中一个视图分配随机背景颜色。 这将与 body 的其余部分一起重新评估，所以如果 `body` 被大量调用，那么你的视图会随着它们改变背景而闪烁。

要在您自己的项目中使用它，首先添加以下 `Color` 扩展以获得随机颜色：

```swift
extension ShapeStyle where Self == Color {
  static var random: Color {
    Color(
      red: .random(in: 0...1),
      green: .random(in: 0...1),
      blue: .random(in: 0...1)
    )
  }
}
```

现在，只要您对正在发生的事情感到好奇，就继续使用它与 `background()`：

```swift
struct ContentView: View {
  var body: some View {
    Text("Hello, world!")
      .background(.random)
  }
}
```

https://user-images.githubusercontent.com/1680273/140460450-d449863f-ee61-49bf-91ea-df50cbccfd9c.mp4