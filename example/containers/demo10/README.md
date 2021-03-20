如何为 `iPadOS` 添加侧边栏？
---

在 `iPadOS` 中，不仅可以显示常规的拆分视图控制器，还可以添加可以通过单击按钮显示的侧边栏。 在 `SwiftUI` 中，我们通过向 `NavigationView` 中添加第三个视图来完成此操作，如下所示：

```swift
struct ContentView: View {
    var body: some View {
        NavigationView {
            Text("Sidebar")
            Text("Primary View")
            Text("Detail View")
        }
    }
}
```

SwiftUI 将自动显示一个按钮，以从屏幕侧面在栏中滑动，如果您使用的是紧凑尺寸类，则还可以在主视图中将其折叠。

如果要在侧边栏中显示列表，则最好使用 `.listStyle()`为侧边栏提供系统标准的主题，如下所示：

```swift
struct ContentView: View {
    var body: some View {
        List(1..<100) { i in
            Text("Row \(i)")
        }
        .listStyle(SidebarListStyle())
    }
}
```