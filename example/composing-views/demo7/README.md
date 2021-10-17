如何将图像插入文本？
===

SWIFTUI允许您使用 `+` 组合文本视图，但您也可以使用简单的文本初始化程序将图像直接放入文本中。 这允许您直接放置在文本内部的图像，包括根据需要提供文本和图像。

例如，这将 `Hello World` 与中间中间有一个星形图像：

```swift
Text("Hello ") + Text(Image(systemName: "star")) + Text(" World!")
```

文本内部的图像将自动调整以匹配您所选择的任何字体或匹配颜色，但请确保将修改器应用于整个加入文本而不是简单的最后一个项目。

例如，这将使整个组合的文本大而蓝：

```swift
(Text("Hello ") + Text(Image(systemName: "star")) + Text(" World!"))
    .foregroundColor(.blue)
    .font(.largeTitle)
```

而这 - 没有额外的括号 - 只会制造大型和蓝色的 `World` 文本：

```swift
Text("Hello ") + Text(Image(systemName: "star")) + Text(" World!")
    .foregroundColor(.blue)
    .font(.largeTitle)
```