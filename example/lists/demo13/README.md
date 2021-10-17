如何使用隐式堆栈？
===

如果创建动态列表并在每一行中放置多个内容，会发生什么情况？ `SwiftUI` 的解决方案简单，灵活，默认情况下会为我们提供出色的行为：它会创建一个隐式 `HStack` 来容纳您的物品，因此它们会自动水平放置。

例如，我们可以创建一行，在其中左侧有一张小图片，并将剩余空间分配给文本字段，然后创建一个由三个用户组成的数组，并在动态列表中显示它们。

这就是代码中的样子：

```swift
// 保存一些数据的示例结构
struct User: Identifiable {
    let id = UUID()
    let username = "Anonymous"
}

// 用于在列表中创建并显示该数据的视图
struct ContentView: View {
    let users = [User(), User(), User()]

    var body: some View {
        List(users) { user in
            Image("paul-hudson")
                .resizable()
                .frame(width: 40, height: 40)
            Text(user.username)
        }
    }
}
```

请注意，我们不需要将图像和文本视图放到 `HStack` 中以使其并排呈现 - SwiftUI 为我们解决了这些问题。