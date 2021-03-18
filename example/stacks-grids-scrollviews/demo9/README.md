如何使用 `ScrollView` 添加水平和垂直滚动？
---

SwiftUI 的 `ScrollView` 允许我们相对轻松地创建视图的滚动容器，因为它会自动调整自身大小以适合我们放置在其中的内容，并且还会自动添加额外的插图以避免出现安全区域。

例如，我们可以创建一个包含十个文本视图的滚动列表，如下所示：

```swift
ScrollView {
    VStack(spacing: 20) {
        ForEach(0..<10) {
            Text("Item \($0)")
                .foregroundColor(.white)
                .font(.largeTitle)
                .frame(width: 200, height: 200)
                .background(Color.red)
        }
    }
}
.frame(height: 350)    
```

滚动视图默认情况下是垂直的，但是您可以通过传入 `.horizontal` 作为第一个参数来控制轴。 因此，我们可以将前面的示例翻转为水平，如下所示：

```swift
ScrollView(.horizontal) {
    HStack(spacing: 20) {
        ForEach(0..<10) {
            Text("Item \($0)")
                .foregroundColor(.white)
                .font(.largeTitle)
                .frame(width: 200, height: 200)
                .background(Color.red)
        }
    }
}
```

您可以使用 `[.horizontal，.vertical]` 同时指定两个轴。

最后，您可以决定是否在滚动动作发生时显示滚动指示器，如下所示：

```swift
ScrollView(.horizontal, showsIndicators: false) {
    HStack(spacing: 20) {
        ForEach(0..<10) {
            Text("Item \($0)")
                .foregroundColor(.white)
                .font(.largeTitle)
                .frame(width: 200, height: 200)
                .background(Color.red)
        }
    }
}
```