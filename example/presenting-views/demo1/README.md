如何将新视图推送到 NavigationView 上？
----

如果您拥有导航视图，并且想将新视图推入 `SwiftUI` 的导航堆栈，则应使用 `NavigationLink`。 这将目的地作为其第一个参数，并将在按钮内显示的内容作为其第二个参数（或作为结尾的闭包），并负责将新视图和动画一起推入堆栈。

例如，这将创建一个简单的 `SecondView` 结构，然后从 `NavigationView` 呈现它：

```swift
struct SecondView: View {
    var body: some View {
        Text("This is the detail view")
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: SecondView()) {
                    Text("Show Detail View")
                }
                .navigationTitle("Navigation")
            }
        }
    }
}
```