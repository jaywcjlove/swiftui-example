如何使用字体，颜色，行距等为文本视图设置样式？
===

![Updated for Xcode 13](https://img.shields.io/static/v1?label=&message=Updated%20for%20Xcode%2013.1&color=blue&logo=Xcode&logoColor=white)
![New in macOS 12](https://img.shields.io/static/v1?label=&message=New%20in%20macOS%2012&color=lightgrey&logo=apple)

文本视图不仅在外观上为我们提供了可预期的广泛控制，而且还旨在与Apple核心技术（例如Dynamic Type）无缝地协同工作。

默认情况下，“Text”视图具有“正文”动态类型样式，但是您可以通过在其上调用 `.font()` 来从其他大小和权重中进行选择，如下所示：

```swift
Text("This is an extremely long text string that will never fit even the widest of phones without wrapping")
    .font(.largeTitle)
    .frame(width: 300)
```

我们可以使用 `.foregroundColor()` 修饰符控制文本的颜色，如下所示：

```swift
Text("The best laid plans")
    .foregroundColor(Color.red)
```

您还可以设置背景颜色，但是它使用 `.background()`，因为可以使用比纯色更高级的背景。 无论如何，要为我们的布局提供黄色背景色，我们可以添加以下内容：

```swift
Text("The best laid plans")
    .padding()    
    .background(Color.red)
    .foregroundColor(.white)
    .font(.headline)
```

提示：您可能想知道为什么我们使用 `foregroundColor()` 的名称具有颜色，而 `background()` 却没有颜色。 这是因为SwiftUI允许我们根据需要为文本重新着色，但是它必须始终是简单的颜色，而您可以在背景中放置任何类型的视图-颜色，是，还可以是形状，其他一些文本等等。

还有更多选择。 例如，我们可以调整文本中的行距。 默认值为0，表示没有应用额外的行距，但是您也可以指定位置值以在行之间添加额外的行距：

```swift
Text("This is an extremely long text string that will never fit even the widest of phones without wrapping")
    .font(.largeTitle)
    .lineSpacing(50)
    .frame(width: 300)
```