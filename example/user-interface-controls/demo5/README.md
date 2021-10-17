如何在 `TextField` 上添加边框？
===

SwiftUI 的 `TextField` 视图默认没有样式，这意味着它在屏幕上是一个空白区域。 如果这符合您想要的样式，那就太好了-您已完成。 但是，我们中的许多人都希望在文本字段周围添加边框以使其更清晰。

如果要获取 `UITextField` 常用的“四舍五入”文本字段样式，则应使用 `.textFieldStyle(RoundedBorderTextFieldStyle())` 修饰符，，如下所示：

```swift
struct ContentView: View {
    @State private var name: String = "Tim"
    var body: some View {
        VStack(alignment: .leading) {
            TextField("Enter your name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Text("Hello, \(name)!")
        }
    }
}
```