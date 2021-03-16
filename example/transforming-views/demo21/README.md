使用 ToggleStyle 自定义 Toggle
----

SwiftUI 为我们提供了 `ToggleStyle` 协议，以自定义 `Toggle` 开关的外观和工作方式。 符合此协议的任何结构都必须实现 `makeBody()` 方法，该方法可以根据需要呈现 `Toggle`，同时提供用于切换的标签和isOn绑定，您可以进行翻转来调整切换。

重要提示：当您自定义这样的 `Toggle` 开关时，您将不得不自己以某种方式打开打开状态 – SwiftUI不会为您完成此操作。

为了演示自定义切换样式，以下是一种使用按钮翻转打开状态，然后添加自定义标签以显示该状态的样式。我没有像标准的 iOS `Toggle` 那样使用动圈，而是使该节目成为两个 `SF` 符号之一：

```swift
struct CheckToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            Label {
                configuration.label
            } icon: {
                Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(configuration.isOn ? .accentColor : .secondary)
                    .accessibility(label: Text(configuration.isOn ? "Checked" : "Unchecked"))
                    .imageScale(.large)
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}

// 一个示例视图，显示了实际的样式
struct ContentView: View {
    @State private var isOn = false

    var body: some View {
        Toggle("Switch Me", isOn: $isOn)
            .toggleStyle(CheckToggleStyle())
    }
}
```