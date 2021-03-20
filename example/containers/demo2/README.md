如何在导航视图中嵌入视图？
---

SwiftUI 的 `NavigationView` 或多或少地映射到 `UIKit` 的 `UINavigationController`，因为它可以显示内容，可以处理视图之间的导航，并将导航栏放置在屏幕顶部。

您可以以最简单的形式将文本视图放入导航视图，如下所示：

```swift
struct ContentView: View {
    var body: some View { 
        NavigationView {
            Text("This is a great app")
        }
    }
}
```

但是，这会使顶部的导航栏为空。 因此，您通常会在要嵌入的内容上使用 `navigationTitle()` 修饰符，因此可以在屏幕顶部添加标题，如下所示：

```swift
struct ContentView: View {
    var body: some View { 
        NavigationView {
            Text("SwiftUI")
                .navigationTitle("Welcome")
        }
    }
}
```

还有第二个修饰符 `navigationBarTitleDisplayMode()`，它使我们可以控制使用大标题还是较小的内联标题。 例如，默认情况下，视图将从任何显示的视图继承其大标题显示模式，或者如果是初始视图，则将使用大标题。 但是，如果您希望手动启用或禁用大标题，则应使用 `.navigationBarTitleDisplayMode()`，如下所示：

```swift
struct ContentView: View {
    var body: some View { 
        NavigationView {
            #if !os(macOS)
            Text("SwiftUI")
                .navigationTitle("Welcome")
                .navigationBarTitleDisplayMode(.inline)
            #else
            Text("SwiftUI")
                .navigationTitle("Welcome")
            #endif
        }
    }
}
```

这样可以制作较小的导航标题，但是您也可以使用 `.large` 强制使用较大的标题。