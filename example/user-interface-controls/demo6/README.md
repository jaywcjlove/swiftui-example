如何将占位符添加到 `TextField`？
===

SwiftUI 的 `TextField` 就像 `UITextField` 一样支持占位符文本-灰色文本，空白时显示在文本字段中，或者使用提示（“输入密码”）或显示一些示例数据。

要设置占位符文本，请将其作为文本字段的初始化程序的一部分传入，如下所示：

```swift
struct ContentView: View {
    @State private var emailAddress = ""

    var body: some View {
        TextField("请输入邮箱地址 xx@xx.com", text: $emailAddress)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
    }
}
```

当该字段为空时，它将在文本字段中显示 `请输入邮箱地址 xx@xx.com`，但是一旦用户在其中输入内容，该字段就会消失。