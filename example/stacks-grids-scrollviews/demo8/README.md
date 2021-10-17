如何根据大小类在 `HStack` 和 `VStack` 之间自动切换？
===

SwiftUI 使我们可以监视当前的大小类，以决定事物的布局方式，例如从空间充足时的 `HStack` 切换到空间受限时的 `VStack`。

稍加思考，我们就可以编写一个新的 `AdaptiveStack` 视图，该视图为我们自动在水平和垂直布局之间切换。 这使在 `iPad` 上创建出色的布局变得更加简单，因为我们的布局将自动调整以适应拆分视图和过渡方案。

外观如下：

```swift
struct AdaptiveStack<Content: View>: View {
    #if !os(macOS)
    @Environment(\.horizontalSizeClass) var sizeClass
    #endif
    let horizontalAlignment: HorizontalAlignment
    let verticalAlignment: VerticalAlignment
    let spacing: CGFloat?
    let content: () -> Content

    init(horizontalAlignment: HorizontalAlignment = .center, verticalAlignment: VerticalAlignment = .center, spacing: CGFloat? = nil, @ViewBuilder content: @escaping () -> Content) {
        self.horizontalAlignment = horizontalAlignment
        self.verticalAlignment = verticalAlignment
        self.spacing = spacing
        self.content = content
    }

    var body: some View {
        Group {
            #if !os(macOS)
            if sizeClass == .compact {
                VStack(alignment: horizontalAlignment, spacing: spacing, content: content)
            } else {
                HStack(alignment: verticalAlignment, spacing: spacing, content: content)
            }
            #else
            HStack(alignment: verticalAlignment, spacing: spacing, content: content)
            #endif
        }
    }
}

struct ContentView: View {
    var body: some View {
        AdaptiveStack {
            Text("Horizontal when there's lots of space")
            Text("but")
            Text("Vertical when space is restricted")
        }
    }
}
```

要进行尝试，请在 `iPad` 模拟器中运行该应用程序，然后尝试使用不同大小的拆分视图-您会看到 `ContentView` 在空间不足时会自动切换到 `VStack`。

现在解释自定义视图的工作原理：

- 它监视 `horizontalSizeClass` 环境键，以便每次尺寸类更改时都会对其进行更新。
- 我们为它提供了分别存储水平和垂直对齐方式的参数，因此您可以精确控制布局的调整方式。
- 有一个可选的 `CGFloat` 用于间距，因为这正是 `VStack` 和 `HStack` 所使用的。 如果您希望获得更多控制，则可以添加 `horizontalSpacing` 和 `verticalSpacing` 属性。
- `content` 属性是一个不接受任何参数并返回某种内容的函数，最终用户将依靠该视图构建器来创建其布局。
- 我们的初始化程序将它们全部藏起来以备后用。
- 在 `body` 属性内，我们可以读取水平尺寸类，然后在 `VStack` 或 `HStack` 中包装对 `content()` 的调用。

就是这样！ 实际的代码并不像您想象的那么难，但是它为我们提供了一些非常有用的灵活性。 