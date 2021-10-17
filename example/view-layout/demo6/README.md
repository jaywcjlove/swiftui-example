如何使用 `ForEach` 循环创建视图？
===

通常，您会发现要遍历序列以创建视图，而在 `SwiftUI` 中，这是使用 `ForEach` 完成的。

重要提示：很容易查看 `ForEach` 并认为它与 `Swift` 序列上的 `forEach()` 方法相同，但事实并非如此。

`SwiftUI` 中的 `ForEach` 本身就是一个视图结构，这意味着您可以根据需要直接从视图主体中返回它。 您为它提供了一组项目，还可能需要告诉 `SwiftUI` 它如何唯一地标识每个项目，以便它知道在值更改时如何更新它们。 您还向它传递了一个函数，该函数要运行以为循环中的每个项目创建一个视图。

对于范围上的简单循环，您可以将范围直接传递到 `ForEach` 中，并告诉 `Swift` 将每个数字用作项目的唯一标识符。 例如，此计数从 `10` 减少到 `1`，然后在末尾添加一条消息：

```swift
VStack(alignment: .leading) {
    ForEach((1...10).reversed(), id: \.self) {
        Text("\($0)…")
    }

    Text("Ready or not, here I come!")
}
```

`.id(:\.self)` 部分是必需的，以便 `SwiftUI` 可以唯一地标识数组中的每个元素–这意味着，如果添加或删除一项，`SwiftUI` 会确切知道哪一个。

您可以使用这种方法来创建任何类型的循环。 例如，此代码创建一个由三种颜色组成的数组，将它们全部循环，并使用每种颜色名称和颜色值创建文本视图：


```swift
struct ContentView: View {
    let colors: [Color] = [.red, .green, .blue]

    var body: some View {
        VStack {
            ForEach(colors, id: \.self) { color in
                Text(color.description.capitalized)
                    .padding()
                    .background(color)
            }
        }
    }
}
```

使用 `\.self` 告诉 `Swift`，每个项目都使用其自己的值进行唯一标识。 因此，如果您有数组 `[1、2、3]` 并用 `\.self` 标识每个值，则意味着第一项具有标识符 `1`，第二个 `2` 和第三个标识符。

如果数组中有自定义类型，则应将id与类型内的任何属性一起使用，以对其进行唯一标识。 例如，您可以创建一个结构，其中id属性是UUID，这意味着它可以保证是唯一的-对于我们的目的而言是完美的。 我们可以创建一个这样的结构，然后像这样使用它：

```swift
struct SimpleGameResult {
    let id = UUID()
    let score: Int
}

struct ContentView: View {
    let results = [
        SimpleGameResult(score: 8),
        SimpleGameResult(score: 5),
        SimpleGameResult(score: 10)
    ]

    var body: some View {
        VStack {
            ForEach(results, id: \.id) { result in
                Text("Result: \(result.score)")
            }
        }
    }
}
```

这告诉 `SwiftUI` 它可以通过查看它们的 `id` 属性来区分 `ForEach` 内部的视图。

或者，如果您创建的结构符合 `Identifiable` 协议，则只需编写 `ForEach(results)`。 遵守该协议意味着添加一个 `id` 属性，该属性唯一地标识每个对象，在我们的例子中，我们已经拥有了它。 因此，此代码实现了相同的结果：

```swift
struct IdentifiableGameResult: Identifiable {
    var id = UUID()
    var score: Int
}

struct ContentView: View {
    let results = [
        IdentifiableGameResult(score: 8),
        IdentifiableGameResult(score: 5),
        IdentifiableGameResult(score: 10)
    ]

    var body: some View {
        VStack {
            ForEach(results) { result in
                Text("Result: \(result.score)")
            }
        }
    }
}
```