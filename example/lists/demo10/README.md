如何创建扩展列表？
---

SwiftUI 的 `List` 视图具有增强的初始化程序，可让我们使用子元素创建展开的部分-它们将通过可点击的箭头进行渲染，并在点按时可打开以显示子元素。

要使用这种形式的 `List`，您需要具有精确形式的数据：您的数据模型应具有一个可选的具有相同类型的子级数组，因此您可以创建树。 通常，您很可能会从 `JSON` 或类似格式加载此类内容，但为了使操作简单起见，我将粘贴一些硬编码的数据，以便您查看其外观。

放置好数据后，您可以通过传递数据数组以及子代位置的键路径（在我们的情况下为 `\.items`）将其加载到列表中。 然后，您将获得常规关闭方式，可以像通常一样提供行数据。

这是代码：

```swift
struct Bookmark: Identifiable {
    let id = UUID()
    let name: String
    let icon: String
    var items: [Bookmark]?

    // 一些示例网站
    static let apple = Bookmark(name: "Apple", icon: "1.circle")
    static let bbc = Bookmark(name: "BBC", icon: "square.and.pencil")
    static let swift = Bookmark(name: "Swift", icon: "bolt.fill")
    static let twitter = Bookmark(name: "Twitter", icon: "mic")

    // 一些示例组
    static let example1 = Bookmark(name: "Favorites", icon: "star", items: [Bookmark.apple, Bookmark.bbc, Bookmark.swift, Bookmark.twitter])
    static let example2 = Bookmark(name: "Recent", icon: "timer", items: [Bookmark.apple, Bookmark.bbc, Bookmark.swift, Bookmark.twitter])
    static let example3 = Bookmark(name: "Recommended", icon: "hand.thumbsup", items: [Bookmark.apple, Bookmark.bbc, Bookmark.swift, Bookmark.twitter])
}

struct ContentView: View {
    let items: [Bookmark] = [.example1, .example2, .example3]

    var body: some View {
        List(items, children: \.items) { row in
            Image(systemName: row.icon)
            Text(row.name)
        }
    }
}
```

提示：这只是占位符数据，因此我多次重复了相同的书签，但希望您能理解。

该代码运行时，您会看到我们的网上论坛的三行，以及可折叠起来以显示其子项的披露指标。