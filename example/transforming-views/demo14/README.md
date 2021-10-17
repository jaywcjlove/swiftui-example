如何调整视图的强调色？
===

iOS 使用浅色为应用程序提供协调的主题，并且在 `SwiftUI` 中以重音色为名提供了相同的功能。 就像在 `UIKit` 中一样，当您设置一个视图的强调颜色时，它会影响其中的所有视图，因此，如果您设置顶级控件的访问颜色，则所有内容都会被着色。

例如，这将在 `VStack` 内创建一个按钮，然后为 `accentColor` 赋予橙色的配色：

```swift
VStack {
    Button("Press Here") {
        print("Button pressed!")
    }
}
.accentColor(.orange)
```