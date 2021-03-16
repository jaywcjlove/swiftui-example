如何通过过渡添加和删除视图？
----

您只需使用常规的 `Swift` 条件就可以在设计中包括或排除视图。 例如，当点击一个按钮时，这会添加或删除一些详细信息文本：

```swift
struct ContentView: View {
    @State private var showDetails = false

    var body: some View {
        VStack {
            Button("Press to show details") {
                withAnimation {
                    showDetails.toggle()
                }
            }

            if showDetails {
                Text("Details go here.")
            }
        }
    }
}
```

默认情况下，`SwiftUI` 使用淡入淡出动画来插入或删除视图，但是如果需要，可以通过将 `transition()` 修饰符附加到视图来更改它。

例如，我们可以使几种文本视图以不同的方式过渡，如下所示：

```swift
struct ContentView: View {
    @State private var showDetails = false

    var body: some View {
        VStack {
            Button("Press to show details") {
                withAnimation {
                    showDetails.toggle()
                }
            }

            if showDetails {
                // Moves in from the bottom
                Text("Details go here.")
                    .transition(.move(edge: .bottom))

                // Moves in from leading out, out to trailing edge.
                Text("Details go here.")
                    .transition(.slide)

                // Starts small and grows to full size.
                Text("Details go here.")
                    .transition(.scale)
            }
        }
    }
}
```