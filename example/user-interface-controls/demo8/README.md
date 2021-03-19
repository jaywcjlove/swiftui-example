如何关闭 `TextField` 的键盘？
---

SwiftUI 的 `TextField` 会在激活后自动显示键盘，但是完成操作后很难隐藏键盘-尤其是当您将 `KeyboardType()` 修饰符与 `.numberPad`，`.decimalPad` 或 `.phonePad` 等一起使用时。

我将向您展示如何在短时间内随时隐藏键盘，但是首先我想说明一件事：SwiftUI没有内置的方法可以做到这一点–我们没有简单的修饰符 依附，所以如果您要解决这个问题，那不是因为您没有尽力而为。

要强制 SwiftUI 隐藏键盘，您需要使用以下代码：

```swift
UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
```

是的，这很长，但是它要求 `UIKit` 搜索所谓的响应者链（即当前正在响应用户输入的控件集合），并找到能够退出其第一响应者状态的控件。 这是一种花哨的说法，“问任何有控制权的人停止使用键盘”，在我们的情况下，这意味着当文本字段处于活动状态时，键盘将被关闭。

由于该代码不是特别容易阅读，因此您应考虑将其包装在如下扩展名中：

```swift
#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
```

现在，您可以从任何 SwiftUI 视图中编写 `hideKeyboard()`。

具体用法取决于您的代码，但以下是一个简单的示例，其中显示了一个小数点填充文本字段，并带有一个用于将其关闭的按钮：

```swift
struct ContentView: View {
    @State private var tipAmount = ""

    var body: some View {
        VStack {
            TextField("Name: ", text: $tipAmount)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.decimalPad)

            Button("Submit") {
                print("Tip: \(tipAmount)")
                hideKeyboard()
            }
        }
    }
}

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
```