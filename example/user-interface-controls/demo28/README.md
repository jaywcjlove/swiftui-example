如何获得突出的边框按钮？
===

![Updated for Xcode 13.0](https://img.shields.io/static/v1?label=&message=Updated%20for%20Xcode%2013.0&color=blue&logo=Xcode&logoColor=white)
![New in iOS 15](https://img.shields.io/static/v1?label=&message=New%20in%20iOS%2015&color=lightgrey&logo=apple)

`SwiftUI` 具有专用的 `.bordered` 按钮样式，模仿了许多 `Apple` 应用程序中使用的常见外观和感觉。 在最基本的形式中，它看起来像这样：

```swift
Button("Buy: $0.99") {
    print("Buying…")
}
.buttonStyle(.bordered)
```

![](./imgs/001.png)

但是，对于应该在屏幕上真正突出的按钮，您可能希望使用 `borderedProminent` 选项使它们的颜色更浓：

```swift
Button("Buy: $0.99") {
    print("Buying for $0.99")
}
.buttonStyle(.borderedProminent)
```

![](./imgs/002.png)

重要提示：有很多突出的按钮并不是好的 UI 实践。

您可以使用 `tint()` 自定义这些按钮的颜色：

```swift
Button("Submit") {
    print("Submitting…")
}
.tint(.indigo)
.buttonStyle(.borderedProminent)
```

![](./imgs/003.png)

或者通过将角色附加到按钮：

```swift
Button("Delete", role: .destructive) {
    print("Deleting…")
}
.buttonStyle(.borderedProminent)
```

![](./imgs/004.png)