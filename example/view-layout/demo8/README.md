如何使两个视图具有相同的宽度或高度？
===

通过将 `frame()` 修饰符与 `fixedSize()` 结合使用，`SwiftUI` 可以轻松地创建两个相同大小的视图，而无论您想要的是相同的高度还是相同的宽度–不需要 `GeometryReader` 或类似对象。

在iOS上，关键是为要缩放的每个视图提供无限的最大高度或宽度，这将自动使其拉伸以填充所有可用空间。 然后，将 `fixedSize()` 应用于它们所在的容器，这告诉 `SwiftUI` 这些视图仅应占用它们所需的空间。 结果是 `SwiftUI` 找出了视图所需的最少空间，然后允许它们占用全部空间–不管它们包含什么，两个视图将始终匹配其大小。

这是一个示例，显示了如何使两个文本视图具有相同的高度，即使它们具有非常不同的文本长度。 多亏了 `frame()` 和 `fixedSize()` 的组合，两个文本视图的布局尺寸相同：

```swift
HStack {
    Text("This is a short string.")
        .padding()
        .frame(maxHeight: .infinity)
        .background(Color.red)

    Text("This is a very long string with lots and lots of text that will definitely run across multiple lines because it's just so long.")
        .padding()
        .frame(maxHeight: .infinity)
        .background(Color.green)
}
.fixedSize(horizontal: false, vertical: true)
.frame(maxHeight: 200)
```

当您要使两个视图具有相同的宽度时，此方法同样适用：

```swift
VStack {
    Button("Log in") { }
        .foregroundColor(.white)
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.red)
        .clipShape(Capsule())

    Button("Reset Password") { }
        .foregroundColor(.white)
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.red)
        .clipShape(Capsule())
}
.fixedSize(horizontal: true, vertical: false)
```
