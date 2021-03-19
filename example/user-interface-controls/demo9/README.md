如何格式化数字的 `TextField`？
---

您可以将格式化程序附加到 SwiftUI 的 `TextField` 上，以限制它可以包含的数据类型，但老实说，它只能做些限制。

为了演示其功能及其局限性，我们可以编写一些代码以使用户在游戏中输入得分并显示他们输入的内容。 这是通过创建一个 `NumberFormatter` 将其数据格式化为十进制数字并将其附加到绑定到整数的 `TextField` 来完成的。

这是代码：

```swift
struct ContentView: View {
    @State private var score = 0

    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()

    var body: some View {
        VStack {
            TextField("转账金额", value: $score, formatter: formatter)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Text("您的分数是 \(score).")
        }
    }
}
```

如果您尝试使用该功能，则会注意到以下几点：

- 仅当用户按下 `Return` 键时，`您的分数是` 文本视图才会更新。
- 用户可以自由输入他们想要的任何类型的文本，并且仅当他们按 `Return` 键时才跳回为数字。
- 他们甚至可以输入无效的数字，例如 `12.34.56`。

如果对此感到满意 – 如果文本字段允许任何输入，并且只在用户按下 `Return` 键时验证其数字并更新其状态，那么您就可以了。

但是，如果您想修复某些问题，很快就会遇到更多问题。 例如，您可以尝试将 `.keyboardType(.decimalPad)` 修饰符附加到文本字段，以将其限制为仅数字和小数点。 但是，现在：

- 用户仍然可以输入多个小数点。
- 没有返回键可以隐藏键盘或更新状态。
- 即使您尝试使用  `UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)` 强制关闭键盘，它仍然无法正常工作，因为状态不会更新 - 就像用户没有输入任何内容一样。

我希望有一个不错的解决方法，但恐怕没有 - 就是不围绕 `UITextField` 滚动您自己的包装器。 同时，您要么接受现有功能的缺点，要么使用诸如 `Stepper` 之类的替代输入机制。