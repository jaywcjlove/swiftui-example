如何创建静态物品列表 `List`？
===

要创建项目的静态列表，您首先需要定义列表中的每一行的外观。 此视图与其他视图一样，可以具有要在行中显示的数据的任何参数。 一旦有了行，就可以创建一个列表视图，该 `List` 视图可以根据需要创建任意多的行。

例如，此代码定义了一个 `Pizzeria` 视图，该视图将显示一个 `name` 字符串，然后将其用作具有三个固定数据段的 `List` 的行：

```swift
struct Pizzeria: View {
    let name: String

    var body: some View {
        Text("Restaurant: \(name)")
    }
}

struct ContentView: View {
    var body: some View {
        List {
            Pizzeria(name: "Joe's Original")
            Pizzeria(name: "The Real Joe's Original")
            Pizzeria(name: "Original Joe's")
        }
    }
}
```

运行该代码后，您将在表中看到三行，就像使用 `UIKit` 中的 `UITableView` 或 `AppKit` 中的 `NSTableView` 一样。

您无需使每一行都使用相同的视图类型，因此您可以根据需要混合和匹配行视图。