如何使用 `allowsHitTesting()` 禁用视图的点击？
===

SwiftUI 允许我们使用 `allowHitTesting()` 修饰符阻止视图接收任何类型的轻击。 如果不允许对视图进行命中测试，则所有轻击都会自动继续通过视图继续到视图后面的任何内容。

为了说明这一点，这是一个 `ZStack`，其中包含一个透明的矩形，该矩形的下面带有一个按钮：

```swift
ZStack {
    Button("Tap Me") {
        print("Button was tapped")
    }
    .frame(width: 100, height: 100)
    .background(Color.white)

    Rectangle()
        .fill(Color.red.opacity(0.2))
        .frame(width: 300, height: 300)
        .clipShape(Circle())
        .allowsHitTesting(false)
}
```

即使矩形位于按钮的顶部，它也具有 `allowHitTesting(false)` -矩形上的任何抽头都不会被矩形捕获，而是传递到下面的按钮。

当您要突出显示一个视图时，这种效果很有用-上方的红色圆圈可能是教程中 “点击此处开始” 的一部分，如果圆圈本身被水龙头抓住，该效果将无效。