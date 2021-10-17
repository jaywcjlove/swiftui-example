如何响应查看生命周期事件：`onAppear()` 和 `onDisappear()` ？
===

SwiftUI 以 `onAppear()` 和 `onDisappear()` 的形式为我们提供了 `UIKit` 的 `viewDidAppear()` 和 `viewDidDisappear()` 的等效项。 您可以将任何代码附加到所需的这两个事件上，`SwiftUI` 将在它们发生时执行它们。

例如，这将创建两个视图，这些视图使用 `onAppear()` 和 `onDisappear()` 打印消息，并带有一个导航链接在两个视图之间移动：

```swift
struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: DetailView()) {
                    Text("Hello World")
                }
            }
        }
        .onAppear {
            print("ContentView appeared!")
        }
        .onDisappear {
            print("ContentView disappeared!")
        }
    }
}

struct DetailView: View {
    var body: some View {
        VStack {
            Text("Second View")
        }
        .onAppear {
            print("DetailView appeared!")
        }
        .onDisappear {
            print("DetailView disappeared!")
        }
    }
}
```

运行该代码后，您应该能够在两个视图之间移动，并查看 `Xcode` 调试控制台中打印的消息。