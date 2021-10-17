如何使用 `padding` 来控制各个视图之间的间距？
===

SwiftUI 允许我们使用 `padding()` 修饰符在视图周围设置单独的填充，从而将视图放置在距离其邻居更远的地方。

如果不使用此参数，则所有方面都会得到系统默认的填充，如下所示：

```swift
VStack {
    Text("SwiftUI")
        .padding()
    Text("rocks")
}
```

但是，您也可以自定义要应用的填充量和位置。 因此，您可能只想将系统填充应用于一侧：

```swift
Text("SwiftUI")
    .padding(.bottom)
```

或者，您可能想控制对所有边应用多少填充：

```swift
Text("SwiftUI")
    .padding(100)
```

或者，您可以将两者结合起来，在视图的一侧添加一定数量的填充：

```swift
Text("SwiftUI")
    .padding(.bottom, 100)
```