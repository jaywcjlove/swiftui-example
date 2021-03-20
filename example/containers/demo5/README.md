如何使用 `tabViewStyle()` 创建内容的滚动页面？
---

SwiftUI 的 `TabView` 相当于 `UIPageViewController` 的两倍，让我们可以在多个内容屏幕中滑动，底部的分页点可以向用户显示它们的位置。

若要激活页面视图样式，请将 `.tabViewStyle()` 修饰符附加到 `TabView` 中，并传入 `PageTabViewStyle()`。

例如，您可以将其添加到您的@main Swift文件中：

```swift
struct ContentView: View {
    var body: some View {
        TabView {
            Text("First")
            Text("Second")
            Text("Third")
            Text("Fourth")
        }
        .tabViewStyle(PageTabViewStyle())
    }
}
```

当它在 `iOS`，`tvOS` 和 `watchOS` 上运行时，您会发现可以在页面列表中滑动。 在 `macOS` 上，不支持 `PageTabViewStyle`。

警告：分页点是白色和半透明的白色，因此，如果您的视图背景也是白色的，您将看不到它们。

为了解决这个问题，您可以通过在 `tabViewStyle()` 之后放置额外的修饰符来要求 `SwiftUI` 在背景后面放置：

```swift
struct ContentView: View {
    var body: some View {
        TabView {
            Text("First")
            Text("Second")
            Text("Third")
            Text("Fourth")
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}
```

您可以通过向 `PageTabViewStyle` 初始化程序添加一个额外的参数来控制分页点的显示方式。 例如，如果您不希望显示分页点，则可以使用以下命令：

```swift
struct ContentView: View {
    var body: some View {
        TabView {
            Text("First")
            Text("Second")
            Text("Third")
            Text("Fourth")
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}
```