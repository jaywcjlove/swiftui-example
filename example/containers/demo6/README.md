如何将视图组合 `Group` 在一起？
===

如果您需要多个视图作为一个视图（例如，一起过渡），则应使用 SwiftUI 的 `Group` 视图。 这一点特别重要，因为出于根本的技术原因，一次最多只能将10个视图添加到父视图。

为了说明这一点，这里是一个包含10条文字的 `VStack`：

```swift
VStack {
    Text("Line")
    Text("Line")
    Text("Line")
    Text("Line")
    Text("Line")
    Text("Line")
    Text("Line")
    Text("Line")
    Text("Line")
    Text("Line")
}
```

这样做很好，但是如果您尝试添加第十一段文本，则会出现如下错误：`ambiguous reference to member 'buildBlock()’`。

…几乎可以肯定，后面会出现更多错误文本。

这是因为 SwiftUI 的视图构建系统具有各种代码，旨在让我们添加1个视图，2个视图，3个视图或4、5、6、7、8、9和10个视图，但不能添加11个或更多视图– 不行

幸运的是，我们可以使用这样的组：

```swift
VStack {
    Group {
        Text("Line")
        Text("Line")
        Text("Line")
        Text("Line")
        Text("Line")
        Text("Line")
    }

    Group {
        Text("Line")
        Text("Line")
        Text("Line")
        Text("Line")
        Text("Line")
    }
}
```

这会产生完全相同的结果，只是现在我们可以超出 10 个视图的限制，因为 `VStack` 仅包含两个视图-两个组。