如何将内容放置在安全区域之外？
===

默认情况下，您的 `SwiftUI` 视图将大部分留在安全区域内 - 它们将进入屏幕底部，但不会靠近设备顶部的任何凹口。

如果您要更改此设置 – 如果您希望视图真正全屏显示，即使这意味着部分被切口或其他硬件切口所遮盖 – 则应使用 `ignoresSafeArea()` 修饰符。

例如，这将创建一个红色文本视图，要求填充所有可用空间，然后将其设置为忽略任何安全区域，以使其真正边缘到边缘。

```swift
Text("Hello World")
    .frame(minWidth: 100, maxWidth: .infinity, minHeight: 100, maxHeight: .infinity)
    .background(Color.red)
    .ignoresSafeArea()
```