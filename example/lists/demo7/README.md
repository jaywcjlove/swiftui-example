如何使用 `EditButton` 启用对列表的编辑？
---

如果已将 SwiftUI 列表视图配置为支持删除或编辑其项目，则可以通过在某处添加 `EditButton` 来允许用户切换列表视图的编辑模式。

例如，此 `ContentView` 结构定义一个用户数组，附加一个 `onDelete()` 方法，然后在导航栏中添加一个编辑按钮：


```swift
struct ContentView: View {
    @State private var users = ["Paul", "Taylor", "Adele"]

    var body: some View {
        NavigationView {
            List {
                ForEach(users, id: \.self) { user in
                    Text(user)
                }
                .onDelete(perform: delete)
            }
            .toolbar {
                #if !os(macOS)
                EditButton()
                #endif
            }
        }
    }

    func delete(at offsets: IndexSet) {
        users.remove(atOffsets: offsets)
    }
}
```

运行该命令后，您会发现可以点击 `编辑` 按钮来启用或禁用列表中项目的编辑模式。