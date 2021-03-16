如何使用 `objectWillChange` 手动发送状态更新？
----

尽管使用 `@Published` 是控制状态更新的最简单方法，但是如果需要特定的操作，也可以手动执行。例如，您可能只希望对给定的值感到满意才刷新视图。

所有可观察的对象都会自动访问 `objectWillChange` 属性，该属性本身具有 `send()`方法，只要我们想刷新观察的视图，就可以调用该方法。

例如：

```swift
// 创建一个可观察的对象类，它宣布
// 更改为其唯一属性
class UserAuthentication: ObservableObject {
    var username = "Taylor" {
        willSet {
            objectWillChange.send()
        }
    }
}

struct ContentView: View {
    @StateObject var user = UserAuthentication()
    var body: some View {
        VStack(alignment: .leading) {
            TextField("Enter your name", text: $user.username)
            Text("Your username is: \(user.username)")
        }
        .padding(100)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```


请注意，我们如何将 `willSet` 属性观察器附加到 `UserAuthentication` 的 `username` 属性上，从而使我们可以在该值更改时运行代码。 在示例代码中，每当用户名更改时，我们都调用 `objectWillChange.send()`，这告诉 `ObjectWillChange` 发布者发布有关我们的数据已更改的消息，以便任何订阅的视图都可以刷新。

提示：该示例与在属性上使用 `@Published` 没什么不同，但是现在我们有了对 `objectWillChange.send()` 的自定义调用，我们可以添加额外的功能–例如，可以将值保存到磁盘。