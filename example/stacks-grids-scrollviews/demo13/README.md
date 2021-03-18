如何使用 `LazyVStack` 和 `LazyHStack` 延迟加载视图？
---

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