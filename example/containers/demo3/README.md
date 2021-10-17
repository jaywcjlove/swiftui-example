如何将栏项目添加到导航视图？
===

`toolbar()` 修饰符使我们可以将单个或多个条形按钮项添加到导航视图的前缘和后缘，以及视需要添加到视图的其他部分。 这些可能是可点击的按钮，但没有限制-您可以添加任何类型的视图。

例如，这在导航视图的尾部添加了一个 `帮助` 按钮：

```swift
struct ContentView: View {
    var body: some View {
        NavigationView {
            Text("SwiftUI")
                .navigationTitle("Welcome")
                .toolbar {
                    Button("帮助") {
                        print("帮助 tapped!")
                    }
                }
        }
    }
}
```
我们尚未指定按钮的显示位置，但是没关系 – `SwiftUI` 知道尾部是从左到右语言的最佳位置，并且会自动将其翻转到另一侧，以显示从右到左的语言。

如果要控制按钮的确切位置，可以通过将其包装在 `ToolbarItem` 中并指定所需的位置来进行控制。 例如，这将创建一个按钮并将其强制置于导航栏的前沿：

```swift
struct ContentView: View {
    var body: some View {
        NavigationView {
            Text("SwiftUI")
                .navigationTitle("Welcome")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Help") {
                            print("Help tapped!")
                        }
                    }
                }
        }
    }
}
```

如果要将多个条形按钮放置在不同的位置，则可以根据需要重复 `ToolbarItem` 多次，并且每次都指定一个不同的放置位置。

要将多个条形按钮放在相同的位置，应将它们包装在 `ToolbarItemGroup` 中，如下所示：

```swift
struct ContentView: View {
    var body: some View {
        NavigationView {
            Text("SwiftUI")
                .navigationTitle("Welcome")
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        Button("About") {
                            print("About tapped!")
                        }

                        Button("Help") {
                            print("Help tapped!")
                        }
                    }
                }
        }
    }
}
```