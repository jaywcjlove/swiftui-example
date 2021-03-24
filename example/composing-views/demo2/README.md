如何将文本视图结合在一起？
---

SwifUI 的 `Text View` 过载+运算符，以便您可以将它们组合在一起以进行新的文本视图。

当您需要在视图中具有不同的格式时，这是有帮助的，因为您可以按照所需的方式查看每个文本视图，然后将它们加入到一起进行单个组合的文本视图。 甚至更好地，当读出来时，声道会自动将它们识别为单个文本。

例如，这会创建三个文本视图，然后使用+将它们加入到要返回的单个文本视图中：

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

提示：将像素相结合的文本视图与SWIFTUI的归属字符串一样密切相关 - 此时不支持使用 `NSAttributedString`。