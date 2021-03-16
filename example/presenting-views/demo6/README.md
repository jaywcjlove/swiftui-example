如何显示弹出视图？
----

`SwiftUI` 有一个专用的修改器来显示弹出窗口，在 `iPadOS` 上它显示为浮动气球，而在 `iOS` 上则像一张纸一样滑到屏幕上。

要显示弹出窗口，您需要某种状态来确定当前是否可见该弹出窗口，但仅此而已 - 与警报和操作表不同，弹出窗口可以包含您想要的任何视图。 因此，只要将您需要的任何东西放在弹出窗口中，`SwiftUI` 就会处理其余的工作。

例如，当点击一个按钮时，将显示一个弹出视图：

```swift
struct ContentView: View {
    @State private var showingPopover = false
    var body: some View {
        Button("Show Menu") {
            showingPopover = true
        }
        .popover(isPresented: $showingPopover) {
            Text("Your content here")
                .font(.headline)
                .padding()
        }
    }
}
```
