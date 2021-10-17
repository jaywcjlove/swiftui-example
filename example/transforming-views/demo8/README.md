如何裁剪视图，以便仅可见部分？
===

通过 `SwiftUI`，您可以使用 `clipShape()` 修饰符剪辑任何视图以控制其形状。

例如，这使用系统图像 “bolt.fill”（一个填充的闪电）创建一个按钮，为其提供一些填充和背景色，然后使用圆圈对其进行裁剪，从而得到一个圆形按钮：

```swift
Button {
    print("Button was pressed!")
} label: {
    Image(systemName: "bolt.fill")
        .foregroundColor(.white)
        .padding()
        .background(Color.green)
        .clipShape(Circle())
}
```

即使 `Circle` 剪辑形状的宽度和高度不相等，也始终会从视图中生成圆–它只会裁剪较大的值以匹配较小的值。

除了 `Circle` 之外，还有 `Capsule`，它可以将视图裁剪成具有菱形形状的圆角。 例如，这将使用胶囊形状创建相同的按钮：

```swift
Button {
    print("Pressed!")
} label: {
    Image(systemName: "bolt.fill")
        .foregroundColor(.white)
        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
        .background(Color.green)
        .clipShape(Capsule())
}
```

我在那里添加了一些更精确的填充以得到更好的形状 – 您应该尝试找到自己喜欢的东西。
