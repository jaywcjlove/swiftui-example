基本表格设计
---

SwiftUI 的表单就像 `HStack` 和 `VStack` 一样可以作为容器使用，这意味着您可以根据需要在其中添加其他视图。 但是，它们会自动适应某些控件的行为和样式，因此它们更适合表单环境。

例如，这将创建一个带有切换，分段控件和按钮的表单：

```swift
struct ContentView: View {
    @State private var enableLogging = false
    @State private var selectedColor = "Red"
    @State private var colors = ["Red", "Green", "Blue"]

    var body: some View {
        Form {
            Picker("Select a color", selection: $selectedColor) {
                ForEach(colors, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(SegmentedPickerStyle())

            Toggle("Enable Logging", isOn: $enableLogging)

            Button("Save changes") {
                // activate theme!
            }
        }
    }
}
```

运行该代码后，您将看到对于表单行为至关重要的两件事：

- 在iOS上，表单自动采用分组列表的样式，因此用户可以看到选项的滚动选择。
- 该按钮已经过调整，看起来像一个可操作的列表行–左对齐，显示为蓝色。

您可以在表单中根据需要拥有任意多的行，但是如果需要的行数超过 `10`，请记住使用组。