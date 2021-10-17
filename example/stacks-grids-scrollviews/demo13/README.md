如何使用 `LazyVStack` 和 `LazyHStack` 延迟加载视图？
===

默认情况下，SwiftUI的VStack和HStack会预先加载其所有内容，如果在滚动视图中使用它们，可能会很慢。 如果您要延迟加载内容（即，仅当内容滚动到视图中时），则应适当使用LazyVStack和LazyHStack。

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(1...100, id: \.self) { value in
                    Text("Row \(value)")
                }
            }
        }
        .frame(height: 300)
    }
}
```

⚠️ 警告：这些惰性堆栈自动具有灵活的首选宽度，因此它们将以常规堆栈不会占用的方式占用可用空间。 要查看它们之间的区别，请尝试上面的代码，您会发现可以使用文本周围的空白来拖拉，但是如果您切换到常规 `VStack`，则会看到需要使用文本本身进行滚动。

使用惰性堆栈时，`SwiftUI`将在首次显示时自动创建视图。 之后，视图将保留在内存中，因此请注意显示的内容。

如果您想了解延迟加载的工作原理，请在iOS应用中尝试以下示例：

```swift
struct SampleRow: View {
    let id: Int

    var body: some View {
        Text("Row \(id)")
    }

    init(id: Int) {
        print("Loading row \(id)")
        self.id = id
    }
}

struct ContentView: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(1...100, id: \.self, content: SampleRow.init)
            }
        }
        .frame(height: 300)
    }
}
```

如果您在 Xcode 中运行该代码，则在滚动时会看到 `Loading row…`（正在加载行…）消息在控制台中打印出来。