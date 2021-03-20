如何使用 `DisclosureGroup` 隐藏和显示内容？
--- 

SwiftUI 具有专用的 `DisclosureGroup` 视图，该视图呈现公开指示器并在其中包含内容。 可以将其绑定到某种Boolean属性，该属性确定内容当前是否可见，但是您可以在其中放置许多视图以在展开时显示。

例如，这将创建一个 `DisclosureGroup`，其中包含大量文本，默认情况下，该文本将被隐藏–用户将需要打开披露指示器来显示它：

```swift
struct ContentView: View {
    @State private var revealDetails = false

    var body: some View {
        DisclosureGroup("Show Terms", isExpanded: $revealDetails) {
            Text("Long terms and conditions here long terms and conditions here long terms and conditions here long terms and conditions here long terms and conditions here long terms and conditions here.")
        }
        .frame(width: 300)
    }
}
```

提示：如果您不需要以编程方式显示或隐藏公开组的内容，则可以完全删除绑定，而只需依赖默认界面即可。