如何在watchOS上制作轮播列表？
===

watchOS 具有一种特别常见的列表样式，可以使用 `List` 轻松复制：列表中的行在移至屏幕上时会滑动并按比例放大，然后在移离屏幕时会滑动并按比例缩小。 这对于较大的图形行特别有效 - 几乎就像 Apple 以前的`Cover Flow` 效果一样。

要启用这种轮播效果，请将 `.listStyle()` 修饰符与 `CarouselListStyle` 的新实例一起使用，如下所示：

```swift
List(1..<51) {
    Text("\($0)")
}
.listStyle(CarouselListStyle())
```

注意：仅在watchOS上可用。