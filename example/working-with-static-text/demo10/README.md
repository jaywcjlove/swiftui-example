如何使用 `privacySensitive()` 将内容标记为私有?
===

![Updated for Xcode 13](https://img.shields.io/static/v1?label=&message=Updated%20for%20Xcode%2013.1&color=blue&logo=Xcode&logoColor=white)
![New in macOS 12](https://img.shields.io/static/v1?label=&message=New%20in%20macOS%2012&color=lightgrey&logo=apple)

SwiftUI 允许我们将视图的某些部分标记为包含敏感信息，这实际上允许我们使用 `redaction` 更轻松地隐藏或显示它。 要在您的代码中使用此功能，首先将 `privacySensitive()` 修饰符添加到任何应隐藏的视图，然后在视图层次结构中的较高位置应用 `.redacted(reason: .privacy)` 修饰符。

例如，如果视图显示在非私有上下文中，这将隐藏用户的信用卡号：

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Text("Card number")
                .font(.headline)

            Text("1234 5678 9012 3456")
                .privacySensitive()
        }
    }
}
```

默认情况下，隐私敏感上下文被灰色框遮住，但您也可以通过从环境中读取 `redaction` 原因来提供自定义布局：

```swift
struct ContentView: View {
    @Environment(\.redactionReasons) var redactionReasons

    var body: some View {
        VStack {
            Text("Card number")
                .font(.headline)

            if redactionReasons.contains(.privacy) {
                Text("[HIDDEN]")
            } else {
                Text("1234 5678 9012 3456")
            }
        }
    }
}
```

有时系统会自动应用隐私 `redaction`，例如如果您的小部件出现在锁定屏幕上（当用户向左滑动时），或者如果他们将 Apple Watch 设置为始终开启并且您的应用程序是可见的——这些都是 您应该将事物标记为隐私敏感的好地方。