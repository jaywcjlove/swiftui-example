如何创建可点击的按钮？
===

SwiftUI 的按钮与 `UIButton` 相似，不同之处在于它在显示内容方面更加灵活，并且它对操作使用闭包，而不是旧的目标/操作系统。

要创建一个带有字符串标题的按钮，您将以如下代码开始：

```swift
Button("Button title") {
    print("Button tapped!")
}
```

例如，您可以制作一个按钮，在点击该按钮时显示或隐藏一些详细信息：

```swift
struct ContentView: View {
    @State private var showDetails = false

    var body: some View {
        VStack(alignment: .leading) {
            Button("Show details") {
                showDetails.toggle()
            }

            if showDetails {
                Text("You should follow me on Twitter: @twostraws")
                    .font(.largeTitle)
            }
        }
    }
}
```

提示：在学习框架时，经典的做法是分散 `print()` 调用，以便您查看何时发生。 如果要通过按钮操作进行尝试，则应首先右键单击预览画布中的播放按钮，然后选择“调试预览”，以便您的 `print()` 调用起作用。

按钮内的标题可以是任何一种视图，因此您可以创建一个图像按钮，如下所示：

```swift
struct ContentView: View {
    @State private var showDetails = false

    var body: some View {
        Button {
            print("Image tapped!")
        } label: {
            Image("sunset")
        }
    }
}
```

在需要增加按钮的可点击区域时，使用自定义标签确实很有帮助，因为您可以对标签应用填充，然后使用 `contentShape(Rectangle()))` 或类似方法使整个区域都可以被点击。

例如，这会在按钮的标签上添加 `20` 个填充点，以确保可以在比可能的位置更大的空间内轻击它：

```swift
Button {
    print("Button pressed")
} label: {
    Text("Press Me")
        .padding(20)
}
.contentShape(Rectangle())
```