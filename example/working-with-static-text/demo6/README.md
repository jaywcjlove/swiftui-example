如何在文字检视中格式化日期？
----

SwiftUI 的文本视图带有两个特定的日期格式化程序，以使日期在屏幕上看起来更好：一个用于处理单个日期，另一个用于处理日期范围。

日期范围版本实际上更简单，因为您只提供了一个封闭的日期范围，并且可以确保根据用户的区域设置对日期范围进行了适当的格式化：

```swift
Text(Date()...Date().addingTimeInterval(600))
```

例如，可能显示 `10:30 AM-10:40AM`。

处理单个日期时，应提供一个 `style` 参数来确定日期的格式。 以下是一些选项：

```swift
VStack {
    // 只显示日期
    Text(Date().addingTimeInterval(600), style: .date)

    // 只显示时间
    Text(Date().addingTimeInterval(600), style: .time)

    // 显示从现在开始的相对距离，并自动更新
    Text(Date().addingTimeInterval(600), style: .relative)

    // 制作计时器样式，自动更新
    Text(Date().addingTimeInterval(600), style: .timer)
}
```