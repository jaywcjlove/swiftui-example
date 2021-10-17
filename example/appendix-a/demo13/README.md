什么是 `@SceneStorage` 属性包装器？
===

如果您想为每个屏幕保存唯一的数据，则应使用 `SwiftUI` 的 `@SceneStorage` 属性包装器。 它的工作方式类似于 `@AppStorage`，为您提供了一个名称来保存内容以及一个默认值，但是它不是使用 `UserDefaults` 而是用于状态恢复 - 甚至可以与多种复杂的多场景一起使用 `iPadOS` 中我们经常看到的设置。

例如，如果您有一个文本编辑器并想存储用户输入的内容，则应使用以下代码：

```swift
struct ContentView: View {
    @SceneStorage("text") var text = ""

    var body: some View {
        #if os(iOS)
        NavigationView {
            TextEditor(text: $text)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        #else
        NavigationView {
            TextEditor(text: $text)
        }
        #endif
    }
}
```

注意：我在此处使用了 `StackNavigationViewStyle`，因为它迫使 `iPad` 将所有空间分配给我们的文本编辑器。

因为它使用 `@SceneStorage`，所以 `SwiftUI` 将自动确保每个场景实例都有其自己的文本副本 – 如果同时运行应用程序，则两者都会正确保存和恢复其数据。

现在，在使用 `@SceneStorage` 之前，`Apple`有一些重要警告：

- 不要保存大量数据； 保存状态恢复所需的一切。
- 永远不要将敏感数据存储在场景存储中，因为它不安全。
- 如果用户转到应用程序切换器并销毁了您的应用程序，则场景存储也将被销毁。