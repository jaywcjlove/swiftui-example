如何使用 Label 并排显示文本和图标？
----

SwiftUI 具有专用的视图类型，用于并排显示文本和图标，这对于菜单，列表等尤其有用。

要使用标签，您可以使用 SF 符号，如下所示：

```swift
Label("Your account", systemImage: "person.crop.circle")
```

或使用您自己的图像，如下所示：

```swift
Label("Welcome to the app", image: "star")
```

您可以使用 `font()` 修饰符并行缩放文本和图标，如下所示：

```swift
Label("Your account", systemImage: "person.crop.circle")
    .font(.title)
```

您可以使用 `TitleOnlyLabelStyle()`，`IconOnlyLabelStyle()` 和 `TitleAndIconLabelStyle()` 应用 `labelStyle()` 修饰符来控制标签的显示方式，如下所示：

```swift
VStack {
    Label("Text Only", systemImage: "heart")
        .font(.title)
        .labelStyle(TitleOnlyLabelStyle())

    Label("Icon Only", systemImage: "star")
        .font(.title)
        .labelStyle(IconOnlyLabelStyle())

    Label("Both", systemImage: "paperplane")
        .font(.title)
        .labelStyle(TitleAndIconLabelStyle())
}
```

提示：`TitleAndIconLabelStyle()` 仅在 `iOS 14.5` 中可用。

如果需要，可以为文本和图像提供完全自定义的视图，如下所示：

```swift
Label {
    Text("Paul Hudson")
        .foregroundColor(.primary)
        .font(.largeTitle)
        .padding()
        .background(Color.gray.opacity(0.2))
        .clipShape(Capsule())
} icon: {
    RoundedRectangle(cornerRadius: 10)
        .fill(Color.blue)
        .frame(width: 64, height: 64)
}
```