如何创建选择器 `Picker` 并从中读取值？
===

SwiftUI 的 `Picker` 视图设法将 `UIPickerView`，`UISegmentedControl` 和 `UITableView` 合并为一个，同时还可以适应其他操作系统上的其他样式。 很棒的是，我们真的不需要关心它的工作原理 – SwiftUI 在自动适应环境方面做得很好。

与大多数其他控件一样，您必须将选择器附加到某种状态，以跟踪选择器的选择。 例如，这将创建一个 `colors` 数组和一个存储选择的颜色的整数，然后将其与选择器和文本视图一起使用，以便您可以看到正在回读的值：


```swift
struct ContentView: View {
    var colors = ["Red", "Green", "Blue", "Tartan"]
    @State private var selectedColor = "Red"

    var body: some View {
        VStack {
            Picker("Please choose a color", selection: $selectedColor) {
                ForEach(colors, id: \.self) {
                    Text($0)
                }
            }
            Text("You selected: \(selectedColor)")
        }
    }
}
```