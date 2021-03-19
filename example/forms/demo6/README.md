显示和隐藏表单行
---

SwiftUI 允许我们根据需要在表单中添加和删除项目，这在您希望根据以前的选择调整可见的选项列表时特别有用。

例如，这显示了一个切换，提示用户是否要显示更多高级选项。 启用该切换后，会出现第二个切换，使他们能够启用日志记录：

```swift
struct ContentView: View {
    @State private var showingAdvancedOptions = false
    @State private var enableLogging = false

    var body: some View {
        Form {
            Section {
                Toggle("Show advanced options", isOn: $showingAdvancedOptions.animation())

                if showingAdvancedOptions {
                    Toggle("Enable logging", isOn: $enableLogging)
                }
            }
        }
    }
}
```

请注意，我是如何将 `animation()` 附加到 `$showingAdvancedOptions` 绑定上的，以便为由于绑定更改而导致的视图更改启用隐式动画。