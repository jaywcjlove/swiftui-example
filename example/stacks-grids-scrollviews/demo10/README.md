如何使用 `ScrollViewReader` 使滚动视图移动到某个位置？
---

如果您想以编程方式使 SwiftUI 的 `ScrollView` 移至特定位置，则应在其中嵌入 `ScrollViewReader`。 这提供了一个 `scrollTo()` 方法，仅通过提供其锚即可将其移动到父 `scrollview` 内部的任何视图。

例如，这将在垂直滚动视图中创建 `100` 个彩色框，并且当您按下按钮时，它将直接滚动到 ID 为 8 的框：

```swift
struct ContentView: View {
    let colors: [Color] = [.red, .green, .blue]

    var body: some View {
        ScrollView {
            ScrollViewReader { value in
                Button("Jump to #8") {
                    value.scrollTo(8)
                }
                .padding()

                ForEach(0..<100) { i in
                    Text("Example \(i)")
                        .font(.title)
                        .frame(width: 200, height: 200)
                        .background(colors[i % colors.count])
                        .id(i)
                }
            }
        }
        .frame(height: 350)
    }
}
```

为了更好地控制滚动，可以指定另一个参数称为 `anchor` ，以控制滚动完成后应将目标视图放置在何处。

例如，这将滚动到与以前相同的视图，只是这次将视图置于顶部：

```swift
struct ContentView: View {
    let colors: [Color] = [.red, .green, .blue]

    var body: some View {
        ScrollView {
            ScrollViewReader { value in
                Button("Jump to #8") {
                    value.scrollTo(8, anchor: .top)
                }
                .padding()

                ForEach(0..<100) { i in
                    Text("Example \(i)")
                        .font(.title)
                        .frame(width: 200, height: 200)
                        .background(colors[i % colors.count])
                        .id(i)
                }
            }
        }
        .frame(height: 350)
    }
}
```

如果在 `withAnimation()` 中调用 `scrollTo()` ，则将对动画进行动画处理。

提示：`scrollTo()` 也适用于列表！