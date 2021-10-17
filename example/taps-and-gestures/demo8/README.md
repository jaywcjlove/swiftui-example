如何使用 `contentShape()` 控制视图的可点击区域？
===

如果您向原始的 `SwiftUI` 视图（如 `Text` 或 `Image`）添加轻击手势，则整个视图将变为可轻敲的。 如果将轻击手势添加到容器SwiftUI视图（例如 `VStack` 或 `HStack`），则 `SwiftUI` 只会将手势添加到容器内部具有某些内容的部分–堆栈的大部分很可能无法应用。

如果这是您想要的，那么默认行为就可以了。 但是，如果要更改命中测试的形状（响应轻击的区域），则应将 `contentShape()` 修饰符与所需的形状一起使用。

例如，此代码创建一个包含图像，分隔符和一些文本的 `VStack`，然后使用 `contentShape()` 修饰符使整个堆栈可轻敲，而不仅仅是图像和文本：

```swift
VStack {
    Image(systemName: "person.circle").resizable().frame(width: 50, height: 50)
    Spacer().frame(height: 50)
    Text("Paul Hudson")
}
.contentShape(Rectangle())
.onTapGesture {
    print("Show details for user")
}
```