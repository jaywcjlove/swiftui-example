如何使用 `listRowBackground()` 设置列表行的背景色？
---

SwiftUI 有一个专用的修饰符，用于设置列表行后面的背景视图，称为 `listRowBackground()`。 这可以接受任何类型的视图（包括颜色，图像和形状），并在行后使用。

例如，这将创建一个包含10行的列表，每行具有红色背景色：

```swift
List {
    ForEach(0..<10) {
        Text("Row \($0)")
    }
    .listRowBackground(Color.red)
}
```

提示：`listRowBackground()` 不会影响列表中不包含数据的任何部分。