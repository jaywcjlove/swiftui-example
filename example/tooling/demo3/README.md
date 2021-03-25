如何在不同的设备中预览布局？
---

`XCode` 的 `SwiftUI` 预览让我们使用 `.previewDevice()` 修改器同时在多个屏幕大小中显示我们的设计。 这需要提供具有 `XCode`目的菜单中的设备的确切名称，例如，如 `XCode` 的目标菜单所示。 `iPhone 12`。

例如，这显示了`iPhone 12 Pro Max`上的预览：

```swift
ContentView()
    .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro Max"))
```

使用特定设备进行预览时，您可能会发现添加在 `.previewDisplayName()` 修改器中有用，允许您在预览窗口中的设备下放置名称。

例如，这为两个不同的设备创建了两个预览，添加了每个的名称，使其清除发生的内容：

```swift
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
            .previewDisplayName("iPhone 12")

        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro Max"))
            .previewDisplayName("iPhone 12 Pro Max")
    }
}
```