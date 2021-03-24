

SwiftUI 为我们提供了 `ContextMenu` 修饰符，用于在我们的应用中创建弹出菜单。 在 `iOS` 中，通常长按即可触发此操作，但其功能与在macOS上单击鼠标右键相同-这是一种灵活的API。

上下文菜单由一组按钮组成，每个按钮都有自己的操作，文本和图标。 文本和图标可以直接在按钮内部提供，因为 `SwiftUI` 将提供隐式的 `HStack` 来确保它们适合系统标准外观。

因此，如果我们希望将上下文菜单附加到某些文本，则可以为该菜单提供两个按钮，如下所示：

```swift
Text("选项")
    .contextMenu {
        Button {
            print("Change country setting")
        } label: {
            Label("Choose Country", systemImage: "globe")
        }

        Button {
            print("Enable geolocation")
        } label: {
            Label("Detect Location", systemImage: "location.circle")
        }
    }
```

要在 `iOS` 上进行尝试，请长按 `选项` 文本以调出菜单，或右键单击 `macOS`。 值得补充的是，您可以将这些类型的菜单附加到任何 `SwiftUI` 视图，而不仅仅是文本视图。