如何创建动态项目列表？
===

为了处理动态项目，您必须首先告诉SwiftUI它如何识别哪个项目是哪个项目。 可以通过手动指定标识属性或使用可标识协议来完成。 该协议只有一个要求，即该类型必须具有某种类型的id值，SwiftUI可以用来查看哪个项目是哪个。

为了说明这一点，我们可以创建三件事，然后将它们放在一起：

1. 一个 `Restaurant` 结构，它说 `Restaurant` 有一个 ID 和名称，该 ID 是一个随机标识符，以便 SwiftUI 知道是哪个。
2. 一个小视图，用于确定列表中的每一行的外观。 在我们的案例中，我们将定义一个 `RestaurantRow` 视图，该视图存储一个餐厅并在文本视图中打印其名称。
3. 显示多个餐厅的列表视图。 这意味着创建一些示例数据，将其放入数组中，然后将其传递到要呈现的列表中。

这就是代码中的全部内容：

```swift
// 用于精确存储一个 Restaurant 数据的结构。
struct Restaurant: Identifiable {
    let id = UUID()
    let name: String
}

// 显示一个 Restaurant 数据的视图。
struct RestaurantRow: View {
    var restaurant: Restaurant

    var body: some View {
        Text("Come and eat at \(restaurant.name)")
    }
}

// 创建三个 Restaurant，然后在列表中显示它们。
struct ContentView: View {
    let restaurants = [
        Restaurant(name: "Joe's Original"),
        Restaurant(name: "The Real Joe's Original"),
        Restaurant(name: "Original Joe's")
    ]

    var body: some View {
        List(restaurants) { restaurant in
            RestaurantRow(restaurant: restaurant)
        }
    }
}
```

其中大部分只是创建数据–最后一部分是真正的动作：使用 `List(restaurants)` 从 `Restaurantss` 数组创建一个列表，对数组中的每个项目执行以下关闭操作一次。 每次关闭 `restaurant` 时，`restaurant`输入都会用数组中的一项填充，因此我们使用它来创建 `RestaurantRow`。

实际上，在像这样的琐碎情况下，我们可以使代码更短：`List(restaurants, rowContent: RestaurantRow.init)` 的作用完全相同。
