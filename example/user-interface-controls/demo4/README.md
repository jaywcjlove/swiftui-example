如何从 `TextField` 读取文本？
===

SwiftUI 的 `TextField` 视图类似于 `UIKit` 中的 `UITextField`，尽管默认情况下看起来有点不同，并且在很大程度上依赖于绑定到状态。

要创建一个，您应该传入一个占位符以在文本字段内使用，外加它应该绑定到的状态值。 例如，这将创建一个绑定到本地字符串的 `TextField`，然后在其下方放置一个文本视图，以显示您键入时文本字段的输出：

```swift
struct ContentView: View {
    @State private var name: String = "Tim"

    var body: some View {
        VStack(alignment: .leading) {
            TextField("Enter your name", text: $name)
            Text("Hello, \(name)!")
        }
    }
}
```

运行该命令后，您应该可以在文本字段中输入文字，并在其正下方看到问候语。

使用文本字段时，有两个重要的条件。 首先，默认情况下，它们没有边框，因此您可能看不到任何东西 – 您需要在其大致位置内轻按以激活键盘。

其次，您可能会发现无法输入布局的画布预览。 如果遇到此问题，请按Cmd + R在模拟器中生成并运行代码。