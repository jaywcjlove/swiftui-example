如何显示实体形状？
===

SwiftUI 具有多种内置形状，例如矩形，圆形和胶囊形，可以根据需要创建，着色和定位每种形状。

例如，如果您想要一个 `200x200` 的红色矩形，则可以使用以下代码：

```swift
Rectangle()
    .fill(Color.red)
    .frame(width: 200, height: 200)
```

同样，如果您想要一个 `100x100` 的蓝色圆圈，则可以使用以下方法：

```swift
Circle()
    .fill(Color.blue)
    .frame(width: 100, height: 100)
```

圆角矩形有专用的形状，可让您自定义应应用的圆角程度，并完全控制圆角的类型。 例如，这将创建一个圆角矩形，每个角上有 `25` 个舍入点：

```swift
RoundedRectangle(cornerRadius: 25)
    .fill(Color.green)
    .frame(width: 150, height: 100)
```

最后，SwiftUI 提供 `Capsule()` 形状作为圆角矩形的一种特殊形式，其中矩形的最短边始终是完全圆角的。 这是带有按钮的流行样式，因为只需几行代码就可以得到胶囊形的按钮：

```swift
Capsule()
    .fill(Color.green)
    .frame(width: 150, height: 100)
```
