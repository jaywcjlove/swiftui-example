如何使用 `SecureField` 创建安全的文本字段？
===

SwiftUI 的 `SecureField` 的工作原理与常规 `TextField` 几乎相同，不同之处在于，出于保护隐私的目的，这些字符被屏蔽掉了。 就像 `TextField` 一样，您需要提供一个占位符，为用户提供输入内容的建议，并且绑定到的基础值仍然是纯字符串，因此您可以根据需要进行检查。

这是一个示例，该示例创建绑定到本地 `@State` 属性的 `SecureField`，以便我们可以显示它们的键入内容：

```swift
struct ContentView: View {
    @State private var password: String = ""

    var body: some View {
        VStack {
            SecureField("Enter a password", text: $password)
            Text("You entered: \(password)")
        }
    }
}
```