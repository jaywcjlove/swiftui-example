如何自定义 `TextField`、`SecureField` 和 `TextEditor` 的提交按钮？
===

![Updated for Xcode 13.0](https://img.shields.io/static/v1?label=&message=Updated%20for%20Xcode%2013.0&color=blue&logo=Xcode&logoColor=white)
![New in iOS 15](https://img.shields.io/static/v1?label=&message=New%20in%20iOS%2015&color=lightgrey&logo=apple)

默认情况下，`TextField` 和 `SecureField` 会在键盘上显示一个简单的 `Return` 按钮，但是 `submitLabel()` 修饰符让我们可以从一系列选项中进行选择。

例如，如果您想为按钮显示 `Join` 的本地化形式，您可以使用：

```swift
struct ContentView: View {
  @State private var username = ""

  var body: some View {
    if #available(iOS 15.0, *) {
      TextField("Username", text: $username)
          .submitLabel(.join)
    } else {
        // Fallback on earlier versions
    }
  }
}
```

![](./imgs/001.png)<!--rehype:style=max-width:320px-->

通过将不同的值传递给 `submitLabel()`，您可以选择许多不同的按钮选项：

- `continue`
- `done`
- `go`
- `join`
- `next`
- `return`
- `route`
- `search`
- `send`

所有这些都可以与 `TextField`、`SecureField` 和 `TextView` 一起使用。