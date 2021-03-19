将表格分为几个部分
---

分成常规部分时，SwiftUI 的表单通常最好地工作，就像常规的内容列表一样。 如何分解它们取决于您，但是通常，按照它们的用途对它们进行分组时效果最好–如果它是一个订购页面，则可以将项目放在一个组中，将自定义放在另一个组中，然后在第三组中交货。

有用的是，表单部分与列表部分相同，这意味着您可以在两个地方重复使用相同的代码。 因此，您可以在各节中添加页眉和/或页脚，也可以不使用它们，而只是在各节之间获得一些屏幕间距。

例如，这将创建一个包含两个部分的表单-第一个具有分段的控件和切换，而第二个具有保存按钮：


```swift
struct ContentView: View {
    @State private var enableLogging = false
    @State private var selectedColor = "Red"
    @State private var colors = ["Red", "Green", "Blue"]

    var body: some View {
        Form {
            Section(footer: Text("Note: Enabling logging may slow down the app")) {
                Picker("Select a color", selection: $selectedColor) {
                    ForEach(colors, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())

                Toggle("Enable Logging", isOn: $enableLogging)
            }

            Section {
                Button("Save changes") {
                    // activate theme!
                }
            }
        }
    }
}
```