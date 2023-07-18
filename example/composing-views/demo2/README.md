如何将文本视图结合在一起？
===

SwifUI 的 `Text View` 重载了 + 运算符，以便您可以将它们组合在一起以创建新的文本视图。

这对于在视图之间需要具有不同格式的情况非常有帮助，因为您可以使每个文本视图看起来完全符合您的要求，然后将它们连接起来以创建一个单独的组合文本视图。更棒的是， `VoiceOver` 在阅读时会自动将它们识别为单个文本块。

例如，以下代码创建了三个文本视图，然后使用+运算符将它们连接成一个返回的单个文本视图：

```swift
Text("SwiftUI ")
    .font(.largeTitle)
+ Text("is ")
    .font(.headline)
+ Text("awesome")
    .font(.footnote)
```

您还可以使用此技术创建不同颜色或文本的字体权重，如下所示：

```swift
Text("SwiftUI ")
    .foregroundColor(.red)
+ Text("is ")
    .foregroundColor(.orange)
    .fontWeight(.black)
+ Text("awesome")
    .foregroundColor(.blue)
```

提示：在 `SwiftUI` 中，像这样组合文本视图是我们接近使用属性字符串的方式，目前不支持使用 `NSAttributedString` 。
