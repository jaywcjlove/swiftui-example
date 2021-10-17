如何在导航视图中预览布局？
===

如果您设计了您知道将作为导航堆栈的一部分呈现的视图，但本身并不包含导航视图，默认情况下不会看到其导航标题或按钮。

幸运的是，您可以将您的视图添加到预览内部的导航视图 - 这模拟了顶部的导航栏，而无需实际为实时代码添加一个，因此您可以查看其外观。

例如，此视图没有导航视图，但是被配置为以特定方式显示，当呈现为一个 - 即从另一个视图推送：

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello World")
            .navigationTitle("Welcome")
    }
}
```

要预览导航视图中的预览，请在预览中添加围绕内容视图的 `NavigationView`：

```swift
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
    }
}
```

这允许您准确地查看视图如何外观，而无需修改视图的实际布局。