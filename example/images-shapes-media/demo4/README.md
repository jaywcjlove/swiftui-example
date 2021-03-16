如何使用SF符号渲染图像？
----

`SwiftUI` 的 `Image` 视图使我们可以从 `SF Symbols` 中加载任何 `2400+` 图标，其中许多图标也可以使用多色。

要从 Apple 的 `SF Symbols` 集中加载图标，请使用 `Image(systemName:)`初始化程序，并传入要加载的图标字符串，如下所示：

```swift
Image(systemName: "cloud.heavyrain.fill")
```

您获得的图像是可缩放的且可着色的，这意味着您可以要求 `SwiftUI` 放大图像以匹配其随附的任何“动态类型”文本样式（如果有）：

```swift
Image(systemName: "cloud.heavyrain.fill")
    .font(.largeTitle)
```

而且这还意味着您可以使用与您已经看到的相同的 `frontantColor()` 修饰符为图像着色：

```swift
Image(systemName: "cloud.heavyrain.fill")
    .font(.largeTitle)
    .foregroundColor(.red)
```

如果您使用的图像包含色彩元素，则可以使用 `.renderingMode().original)` 激活多色模式，如下所示：

```swift
Image(systemName: "cloud.sun.rain.fill")
    .renderingMode(.original)
    .font(.largeTitle)
    .padding()
    .background(Color.black)
    .clipShape(Circle())
```

您可以选择将 `foregroundColor()` 修改器应用于多色 SF符号，这将使部分符号重新着色。 例如，这将使图标的一部分变为蓝色，而部分变为绿色：

```swift
Image(systemName: "person.crop.circle.fill.badge.plus")
    .renderingMode(.original)
    .foregroundColor(.blue)
    .font(.largeTitle)
```

对于其他渐变样式，请尝试 `RadialGradient` 或 `AngularGradient`。 例如，这将创建一个从圆心开始到边缘的各种颜色的径向渐变：

```swift
Circle()
    .fill(
        RadialGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple]), center: .center, startRadius: 50, endRadius: 200)        
    )
    .frame(width: 200, height: 200)
```

这将创建一个角度渐变（通常称为圆锥渐变），循环显示各种颜色，然后返回到起点：

```swift
Circle()
    .fill(
        AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center)
    )
    .frame(width: 200, height: 200)
```

由于所有三种渐变类型均符合 `ShapeStyle` 协议，因此可以将它们用于背景，填充和笔触。 例如，这使用我们的彩虹圆锥形渐变作为圆的粗内部笔画：

```swift
Circle()
    .strokeBorder(
        AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center, startAngle: .zero, endAngle: .degrees(360)),
        lineWidth: 50
    )
    .frame(width: 200, height: 200)
```