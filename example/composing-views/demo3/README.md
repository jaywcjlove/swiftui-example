如何将视图存储为属性？
===

如果您在另一个视图中嵌套了几种视图，则可能会发现为某些或全部创建属性，以使布局代码更容易。 然后，您可以在视图代码内彻底引用这些属性，帮助保持清除。

例如，这会创建两个文本视图作为属性，然后将它们放在 `VStack` 中：

```swift
struct ContentView: View {
    let title = Text("Paul Hudson")
                    .bold()
    let subtitle = Text("Author")
                    .foregroundColor(.secondary)

    var body: some View {
        VStack {
            title
            subtitle
        }
    }
}
```

如您所见，只需在堆栈中写入属性名称就足够了。

但是，甚至更好就是您可以将修改器附加到这些属性名称，如下所示：

```swift
struct ContentView: View {
    let title = Text("Paul Hudson")
                    .bold()
    let subtitle = Text("Author")
                    .foregroundColor(.secondary)

    var body: some View {
        VStack {
            title
                .foregroundColor(.red)
            subtitle
        }
    }
}
```

这不会改变标题的底层样式，只有它的一个具体用法。