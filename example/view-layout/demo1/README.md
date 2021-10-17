如何给视图定制 `frame`？
===

默认情况下，SwiftUI 的视图仅占用所需的空间，但是如果要更改视图的大小，可以使用 `frame()` 修饰符告诉 `SwiftUI` 您想要的大小范围。

例如，您可以创建一个具有 `200x200` 可点击区域的按钮，如下所示：

```swift
Button {
    print("Button tapped")
} label: {
    Text("Welcome")
        .frame(minWidth: 0, maxWidth: 200, minHeight: 0, maxHeight: 200)
        .font(.largeTitle)
}
```

或者，您可以通过指定一个框架，使其最小宽度和高度为零，并为最大宽度和高度，使其无穷大，从而使文本视图填充整个屏幕（减去安全区域），如下所示：

```swift
Text("Please log in")
    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    .font(.largeTitle)
    .foregroundColor(.white)
    .background(Color.red)
```

⚠️ 注意：如果要使视图进入安全区域，请确保添加了 `ignoresSafeArea()` 修饰符。