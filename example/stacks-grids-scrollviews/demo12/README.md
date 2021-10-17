如何使用 `LazyVGrid` 和 `LazyHGrid` 在网格中放置视图？
===

SwiftUI 的 `LazyVGrid` 和 `LazyHGrid` 为我们提供了相当多的灵活性的网格布局。 最简单的网格由三部分组成：原始数据，描述所需布局的 `GridItem` 数组以及将数据和布局组合在一起的 `LazyVGrid` 或 `LazyHGrid`。

例如，这将使用大小为80点的像元创建垂直网格布局：

```swift
struct ContentView: View {
    let data = (1...100).map { "Item \($0)" }

    let columns = [
        GridItem(.adaptive(minimum: 80))
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(data, id: \.self) { item in
                    Text(item)
                }
            }
            .padding(.horizontal)
        }
        .frame(maxHeight: 300)
    }
}
```

使用 `GridItem(.adaptive(minimum：80)` 意味着我们希望网格可以容纳每行尽可能多的项目，每个网格的最小大小为 `80`点。

如果要控制列数，可以改用 `.flexible()`，它还可以让您指定每个项目的大小，但现在可以控制有多少列。 例如，这将创建五列：

```swift
struct ContentView: View {
    let data = (1...100).map { "Item \($0)" }

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(data, id: \.self) { item in
                    Text(item)
                }
            }
            .padding(.horizontal)
        }
        .frame(maxHeight: 300)
    }
}
```

第三种选择是使用固定大小。 例如，这将使第一列的宽度恰好为 `100` 点，并允许第二列填充所有剩余空间：

```swift
struct ContentView: View {
    let data = (1...100).map { "Item \($0)" }

    let columns = [
        GridItem(.fixed(100)),
        GridItem(.flexible()),
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(data, id: \.self) { item in
                    Text(item)
                }
            }
            .padding(.horizontal)
        }
        .frame(maxHeight: 300)
    }
}
```

您还可以使用 `LazyHGrid` 制作水平滚动的网格，除了在初始化程序中接受行之外，其工作方式几乎相同。

例如，我们可以创建 `10` 个并排的标题图像，它们像这样水平滚动：

```swift
struct ContentView: View {
    let items = 1...50

    let rows = [
        GridItem(.fixed(50)),
        GridItem(.fixed(50))
    ]

    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows, alignment: .center) {
                ForEach(items, id: \.self) { item in
                    Image(systemName: "\(item).circle.fill")
                        .font(.largeTitle)
                }
            }
            .frame(height: 150)
        }
    }
}
```

如您所见，创建水平和垂直网格所需的代码几乎相同，仅更改了 `columns` 的 `rows`。

如果需要支持 `iOS 13`，则您将无权访问 `LazyHGrid` 或 `LazyVGrid`，因此请阅读以下内容以了解其他方法...

SwiftUI 为我们提供了用于垂直布局的 `VStack` 和用于水平布局的 `HStack`，但没有做到这两者–没有可以在网格结构中布局视图的东西。

幸运的是，我们可以利用 SwiftUI 的视图生成器系统来编写自己的代码。 这意味着编写必须使用行数和列数以及必须运行的闭包才能检索网格中给定单元格的视图的类型。 然后，可以在主体内部遍历所有行和列，并在 `VStack` 和 `HStack` 内部创建单元格以形成网格，每次调用视图关闭以询问单元格中应包含的内容。

在代码中，它看起来像这样：

```swift
struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content

    var body: some View {
        VStack {
            ForEach(0 ..< rows, id: \.self) { row in
                HStack {
                    ForEach(0 ..< columns, id: \.self) { column in
                        content(row, column)
                    }
                }
            }
        }
    }

    init(rows: Int, columns: Int, @ViewBuilder content: @escaping (Int, Int) -> Content) {
        self.rows = rows
        self.columns = columns
        self.content = content
    }
}

// An example view putting GridStack into practice.
struct ContentView: View {
    var body: some View {
        GridStack(rows: 4, columns: 4) { row, col in
            Image(systemName: "\(row * 4 + col).circle")
            Text("R\(row) C\(col)")
        }
    }
}
```

这将创建一个 `4x4` 网格，每个单元格中均包含图像和文本。