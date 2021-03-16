如何模糊视图？
----

`blur()` 修饰符使我们可以根据自己的选择将实时高斯模糊应用于视图。

例如，这将创建 `300x300` 的个人资料图片，然后添加 `20` 点高斯模糊：

```swift
Image("dog")
    .resizable()
    .frame(width: 300, height: 300)
    .blur(radius: 20)
```

您可以模糊任何所需的内容，包括文本视图：

```swift
Text("Welcome to my SwiftUI app")
    .blur(radius: 2)
```

模糊非常有效，您可以像其他任何状态一样动态调整它。例如，这使您可以尝试通过拖动滑块来动态调整文本的模糊度：

```swift
struct ContentView: View {
    @State private var blurAmount: CGFloat = 0

    var body: some View {
        VStack {
            Text("Drag the slider to blur me")
                .blur(radius: blurAmount)

            Slider(value: $blurAmount, in: 0...20)
        }
    }
}
```