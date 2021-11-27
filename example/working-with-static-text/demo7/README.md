如何使用 textCase() 使 TextField 大写或小写？
===

![Updated for Xcode 13](https://img.shields.io/static/v1?label=&message=Updated%20for%20Xcode%2013.1&color=blue&logo=Xcode&logoColor=white)
![New in macOS 12](https://img.shields.io/static/v1?label=&message=New%20in%20macOS%2012&color=lightgrey&logo=apple)

SwiftUI 的 `TextField` 视图通常允许用户以他们希望的任何大小写文本，但是如果要控制，则可以使用 `textCase()` 修饰符强制使用大写或小写文本。

例如，这要求用户输入他们的名字，并在每个字母大写：

```swift
struct ContentView: View {
    @State private var name = "Paul"

    var body: some View {
        TextField("Shout your name at me", text: $name)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .textCase(.uppercase)
            .padding(.horizontal)
    }
}
```