如何阅读点击和双击手势？
===

任何 SwiftUI 视图都可以附加轻击操作，并且您可以指定触发该操作之前应接收的轻击次数。

例如，这将创建一个文本视图，在点击该文本视图时将显示一条消息：

```swift
Text("Tap me!")
    .onTapGesture {
        print("Tapped!")
    }
```

这将创建一个图像视图，该图像视图在双击时会显示一条消息：

```swift
Image("singapore")
    .onTapGesture(count: 2) {
        print("Double tapped!")
    }
```