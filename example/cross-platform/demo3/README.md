如何在watchOS上制作轮播列表？
===

![Updated for Xcode 13](https://img.shields.io/static/v1?label=&message=Updated%20for%20Xcode%2013.0&color=blue&logo=Xcode&logoColor=white)
![New in watchOS 8](https://img.shields.io/static/v1?label=&message=New%20in%20watchOS%207&color=lightgrey&logo=apple)

`watchOS` 有一种特别常见的列表样式，可以使用 `List` 轻松复制：列表中的行在移动到屏幕上时滑动并放大，然后在移出屏幕时滑动并缩小。 这对于更粗的图形行特别有效 - 它几乎就像 `Apple` 旧的 `Cover Flow` 效果。

要启用此轮播效果，请将 `.listStyle()` 修饰符与 `.carousel` 一起使用，如下所示：

```swift
List(1..<51) {
    Text("\($0)")
}
.listStyle(.carousel)
```

🚧 重要提示：如果您使用 `Xcode 12`，则需要使用 `CarouselListStyle()` 而不是 `.carousel`。

🚧 注意：这仅在 `watchOS` 上可用。