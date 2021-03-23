如何使用带有自定义字体的动态类型？
---

如果您使用的是 `iOS 14` 或更高版本，则无需进一步处理，您的自定义字体就会自动缩放。 但是，如果您希望字体相对于特定的 `Dynamic Type` 字体缩放，则应使用 `relativeTo` 参数，如下所示：

```swift
Text("Scaling")
    .font(.custom("Georgia", size: 24, relativeTo: .headline))
```

这将以 `24pt` 开始字体，但是它将相对于`Headline Dynamic Type`字体放大和缩小。

如果您需要定位 `iOS 13`，请继续阅读以下内容…

SwiftUI 支持所有 `Dynamic Type` 的字体大小，所有字体大小都使用 `.font()` 修饰符进行设置。 但是，如果您要求特定的字体和大小，则会发现文本不再根据用户的 `Dynamic Type` 设置自动缩放，而是保持固定。

要解决此问题，我们需要创建一个自定义 `ViewModifier`，它可以根据当前的辅助功能设置来缩放字体大小，并检测该设置何时更改。

我将首先为您提供代码，然后逐步介绍它的工作方式以及原因：

```swift
@available(iOS 13, macCatalyst 13, tvOS 13, watchOS 6, *)
struct ScaledFont: ViewModifier {
    @Environment(\.sizeCategory) var sizeCategory
    var name: String
    var size: CGFloat

    func body(content: Content) -> some View {
       let scaledSize = UIFontMetrics.default.scaledValue(for: size)
        return content.font(.custom(name, size: scaledSize))
    }
}

@available(iOS 13, macCatalyst 13, tvOS 13, watchOS 6, *)
extension View {
    func scaledFont(name: String, size: CGFloat) -> some View {
        return self.modifier(ScaledFont(name: name, size: size))
    }
}
```

这就是获取与动态类型一起使用的自定义字体所需的全部代码。 作为使用它的示例，下面是一个带有两个文本视图的列表，一个使用内置字体，另一个使用可缩放的佐治亚州字体：

```swift
struct ContentView: View {
    var body: some View {
        List {
            Text("Hello World")
            Text("Hello World")
                .scaledFont(name: "Georgia", size: 12)
        }
    }
}
```

现在您已经了解了它的工作原理，让我们看一下它的工作原理。

首先，我们有以下自定义视图修饰符：

```swift
struct ScaledFont: ViewModifier {
    @Environment(\.sizeCategory) var sizeCategory
    var name: String
    var size: CGFloat

    func body(content: Content) -> some View {
       let scaledSize = UIFontMetrics.default.scaledValue(for: size)
        return content.font(.custom(name, size: scaledSize))
    }
}
```

这将接受我们字体的名称和大小，然后使用 `UIFontMetrics` 将请求的字体放大到与用户当前设备设置匹配的字体，然后将其发送回去。

然后，将其包装在View的扩展中，以使其更易于使用：

```swift
@available(iOS 13, macCatalyst 13, tvOS 13, watchOS 6, *)
extension View {
    func scaledFont(name: String, size: CGFloat) -> some View {
        return self.modifier(ScaledFont(name: name, size: size))
    }
}
```

所有的工作就是包装对自定义字体修饰符的调用，以使它在我们的视图中看起来更好–这意味着我们编写使用 `.scaledFont(name: "Georgia", size: 12)` 而不是 `.modifier(ScaledFont(name: "Georgia", size: 12))`。

现在，您可能想知道如果我们要做的只是传递数据，为什么我们需要自定义视图修饰符。 好吧，线索就在我们的视图修饰符的这一行中：

```swift
@Environment(\.sizeCategory) var sizeCategory
```
这就要求系统从环境中提供当前大小类别，从而确定将 `Dynamic Type` 设置为哪个级别。 诀窍是我们实际上并没有使用它-我们不在乎动态类型设置是什么，而是通过要求系统在更改时更新我们来同时运行我们的 `UIFontMetrics` 代码，从而导致我们的字体 正确缩放。

提示：`UIFontMetrics` 类在 `macOS` 上不可用，这就是为什么我添加了 `@available` 标记的原因。
