如何滚动到列表中的特定行？
---

如果您想以编程方式使 `SwiftUI` 的列表移动以显示特定行，则应将其嵌入 `ScrollViewReader` 中。 这在其代理上提供了 `scrollTo()` 方法，只需提供其 ID 和锚点（可选）即可移动到列表内的任何行。

例如，这将在列表中创建100行，并且当您按下按钮时，它将直接滚动到 ID 为 50 的行：

```swift
struct ContentView: View {
    var body: some View {
        ScrollViewReader { proxy in
            VStack {
                Button("Jump to #50") {
                    proxy.scrollTo(50)
                }

                List(0..<100) { i in
                    Text("Example \(i)")
                    .id(i)
                }
            }
        }
    }
}
```

若要更好地控制滚动行为，请添加一个锚点作为第二个参数，如下所示：`proxy.scrollTo(50, anchor: .top)`。

提示：如果在 `withAnimation()` 中调用 `scrollTo()`，则将对动画进行动画处理。