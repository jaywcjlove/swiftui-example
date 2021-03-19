如何让用户从列表中删除行？
---

通过将 onDelete(perform:) 处理程序附加到您的部分或全部数据，SwiftUI 使用户轻松滑动即可删除行。 该处理程序需要具有一个特定的签名，该签名接受要删除的多个索引，如下所示：

```swift
func delete(at offsets: IndexSet) {
    // delete the objects here
}
```

在其中，您通常需要调用 `Swift` 的 `remove(atOffsets:)` 方法来从序列中删除请求的行。 由于 `SwiftUI` 正在监视您的状态，因此您所做的任何更改都会自动反映在您的UI中。

例如，此代码创建一个包含三个项目的列表的 `ContentView` 结构，然后附加一个 `onDelete(perform:)` 修饰符，该修饰符从列表中删除任何项目：

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
        }
    }

    func delete(at offsets: IndexSet) {
        users.remove(atOffsets: offsets)
    }
}
```

如果您运行该代码，就会发现可以滑动删除列表中的任何行。

提示：如果您想知道，`onDelete()` 可以作为 `ForEach` 的修饰符，但不能直接作为 `List` 的修饰符。 这是因为列表可以包含静态行，但是这些静态行当然不能删除。