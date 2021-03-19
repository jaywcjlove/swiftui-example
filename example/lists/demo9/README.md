如何创建分组和插入分组列表？
---

SwiftUI 的 List 视图有一个 `listStyle()` 修饰符来控制列表的外观，并且您可能需要两个选项：`GroupedListStyle()` 获取旧的项目分组，`InsetGroupedListStyle()` 获得新的 `iOS 13-style` 的项目分组。

例如，这定义了一个示例行并将其放置在分组列表内：

```swift
struct ExampleRow: View {
    var body: some View {
        Text("Example Row")
    }
}

struct ContentView: View {
    var body: some View {
        List {
            Section(header: Text("Examples")) {
                ExampleRow()
                ExampleRow()
                ExampleRow()
            }
        }
        .listStyle(GroupedListStyle())
    }
}
```

或者，这将创建具有新插入样式分组的 `100` 行的列表：

```swift
List(0..<100) { i in
    Text("Row \(i)")
}
.listStyle(InsetGroupedListStyle())
```