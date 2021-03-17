如何渲染渐变？
---

SwiftUI 为我们提供了各种渐变选项，所有这些选项都可以以多种方式使用。 例如，您可以使用白色到黑色的线性渐变来渲染文本视图，如下所示：

```swift
Text("Hello World")
    .padding()
    .foregroundColor(.white)
    .font(.largeTitle)
    .background(
        LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom)
    )
```

颜色被指定为一个数组，您可以根据需要设置任意多个颜色–默认情况下，`SwiftUI` 会将它们均匀地隔开。 因此，我们可以像这样从白色变成红色再变成黑色：

```swift
Text("Hello World")
    .padding()
    .foregroundColor(.white)
    .font(.largeTitle)
    .background(
        LinearGradient(gradient: Gradient(colors: [.white, .red, .black]), startPoint: .top, endPoint: .bottom)
    )
```

要制作水平渐变而不是垂直渐变，请使用 `.lead` 和 `.trailing` 作为起点和终点：

```swift
Text("Hello World")
    .padding()
    .foregroundColor(.white)
    .font(.largeTitle)
    .background(
        LinearGradient(gradient: Gradient(colors: [.white, .red, .black]), startPoint: .leading, endPoint: .trailing)
    )
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