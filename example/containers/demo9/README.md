如何创建工具栏并向其中添加按钮？
---

SwiftUI 的 `toolbar()` 修饰符使我们可以将条形按钮项目放置在顶部或底部空间的任何位置，但前提是我们的视图嵌入在 `NavigationView` 中。

如果要将按钮放置在屏幕底部的工具栏中，请使用 `toolbar()`，然后使用 `.bottomBar` 的位置创建一个 `ToolbarItem`，如下所示：

```swift
NavigationView {
    Text("Hello, World!").padding()
        .navigationTitle("SwiftUI")
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                Button("Press Me") {
                    print("Pressed")
                }
            }
        }
}
```

要获得多个按钮，请使用 `ToolbarItemGroup` 而不是简单的 `ToolbarItem`，然后在其中放置多个按钮：

```swift
NavigationView {
    Text("Hello, World!").padding()
        .navigationTitle("SwiftUI")
        .toolbar {
            ToolbarItemGroup(placement: .bottomBar) {
                Button("First") {
                    print("Pressed")
                }

                Button("Second") {
                    print("Pressed")
                }
            }
        }
}
```

如果要分隔 `ToolbarItemGroup` 中的按钮，请在任意位置添加间隔视图。 例如，这将在工具栏的左边缘放置一个按钮，在右边缘放置一个按钮：

```swift
NavigationView {
    Text("Hello, World!").padding()
        .navigationTitle("SwiftUI")
        .toolbar {
            ToolbarItemGroup(placement: .bottomBar) {
                Button("First") {
                    print("Pressed")
                }

                Spacer()

                Button("Second") {
                    print("Pressed")
                }
            }
        }
}
```