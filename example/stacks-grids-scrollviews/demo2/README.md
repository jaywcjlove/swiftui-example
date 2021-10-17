如何使用对齐和间距自定义堆栈布局？
===

您可以通过在初始化程序中提供一个值来在 `SwiftUI` 堆栈内添加 `spacing`，如下所示：

```swift
VStack(spacing: 50) {
    Text("SwiftUI")
    Text("rocks")
}
```

另外，您可以在项目之间创建分隔线，以便 `SwiftUI` 在堆栈中的每个项目之间进行小的视觉区分，如下所示：

```swift
VStack {
    Text("SwiftUI")
    Divider()
    Text("rocks")
}
```

默认情况下，堆栈中的项目在中心对齐。 对于 `HStack`，这意味着项目在中间垂直对齐，因此，如果您有两个高度不同的文本视图，则它们都将在其垂直中心对齐。 对于 `VStack`，这意味着项目在中间居中对齐，因此，如果您有两个不同长度的文本视图，则它们都将与其水平中心对齐。

要对此进行调整，请在创建堆栈时传递对齐方式，如下所示：

```swift
VStack(alignment: .leading) {
    Text("SwiftUI")
    Text("rocks")
}
```

这样会将 `SwiftUI` 和 `rocks` 都对齐到其左边缘，但是它们最终仍将位于屏幕的中间，因为堆栈仅占用所需的空间。

当然，您可以同时使用对齐和间距，如下所示：

```swift
VStack(alignment: .leading, spacing: 20) {
    Text("SwiftUI")
    Text("rocks")
}
```

这样会将两个文本视图水平对齐到前缘（左到右语言为左对齐），并在它们之间放置20个垂直点。