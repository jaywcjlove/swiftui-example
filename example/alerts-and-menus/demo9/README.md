如何让用户从菜单中选择选项？
===

SwiftUI的 `Picker` 视图具有一种称为 `MenuPickerStyle` 的专用样式，该样式显示其选项的弹出菜单，并且 `Picker` 的标签显示为可点击的按钮。 菜单本身将自动在当前选择的选项旁边显示一个复选标记，并且可以根据屏幕上选取器的位置向上或向下显示。

为了说明这一点，我们可以制作一个小菜单按钮，让用户选择一种绘画颜色：

```swift
struct ContentView: View {
    @State private var selection = "Red"
    let colors = ["Red", "Green", "Blue", "Black", "Tartan"]

    var body: some View {
        VStack {
            Picker("Select a paint color", selection: $selection) {
                ForEach(colors, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(MenuPickerStyle())

            Text("Selected color: \(selection)")
        }
    }
}
```