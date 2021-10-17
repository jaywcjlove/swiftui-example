如何显示动作面板？
===

SwiftUI 为我们提供了用于创建操作表以供用户选择的 `ActionSheet` 视图，其工作方式与警报类似。

与警报一样，您需要定义一个属性，该属性将跟踪操作表是否可见。 然后，使用 `actionSheet()` 修饰符监视该属性，并在条件变为true时显示您选择的操作表。

重要：操作表在 `macOS` 上不可用。

例如，这是一个示例视图，当点击按钮时会触发一个动作表：

```swift
struct ContentView: View {
    @State private var showingSheet = false

    var body: some View {
        Button("Show Action Sheet") {
            showingSheet = true
        }
        .actionSheet(isPresented: $showingSheet) {
            ActionSheet(
                title: Text("What do you want to do?"),
                message: Text("There's only one choice..."),
                buttons: [.default(Text("Dismiss Action Sheet"))]
            )
        }
    }
}
```