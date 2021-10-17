如何允许列表中的行选择？
===

SwiftUI 的列表支持单项和多项选择，但仅当您的列表处于编辑模式时才可以。

要支持单选，请首先在列表中添加与您使用的类型相同的可选属性。 例如，如果使用整数列表，则将具有可选的 `Int`。 完成后，使用其选择参数将其传递到列表，然后确保列表处于编辑模式。

例如，此代码显示列表中的字符串数组，并将所选项目存储为可选字符串：

```swift
struct ContentView: View {
    @State private var selection: String?

    let names = [
        "Cyril",
        "Lana",
        "Mallory",
        "Sterling"
    ]

    var body: some View {
        NavigationView {
            List(names, id: \.self, selection: $selection) { name in
                Text(name)
            }
            .navigationTitle("List Selection")
            .toolbar {
                EditButton()
            }
        }
    }
}
```

请注意，工具栏中的“编辑”按钮–请记住，您的列表必须处于编辑模式才能支持选择。

如果要进行多项选择，您要做的就是将 `selection` 属性更改为与列表数组相同类型的 `Set`。 因此，如果我们希望在上一个示例中进行多项选择，则可以使用以下方法：

```swift
@State private var selection = Set<String>()
```

提示：您可以通过编程方式更改单个和多个选择选项，从而允许您通过自己修改状态来更改选择了哪些行。