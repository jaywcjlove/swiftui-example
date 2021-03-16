如何使用 Text 视图创建静态标签？
----

文本视图在屏幕上显示静态文本，等效于 `UIKit` 中的 `UILabel`。 从最基本的角度来看，它们看起来像这样：

```swift
Text("Hello World")
```

在内容视图的预览窗口中，您可能会看到“自动预览更新已暂停” –继续，然后按 `Resume`，让 `Swift` 开始构建代码并向您显示其外观的实时预览。

提示：您可以随时按 <kbd>⌘</kbd> + <kbd>⌥</kbd> + <kbd>p</kbd> 继续这些预览。

默认情况下，文本视图会根据需要自动换行，但是如果您希望限制它们可以使用的行数，则应添加 `lineLimit` 修饰符，如下所示：

```swift
Text("This is some longer text that is limited to three lines maximum, so anything more than that will cause the text to clip.")
    .lineLimit(3)
    .frame(width: 200)
```

提示：请注意 `lineLimit(3)` 在 `Text("Hello World")` 下方和右侧的放置方式。 这不是必需的，但是从长远来看，这确实使您的代码更易于阅读。

如果您在某些文本上设置了行数限制，然后为其提供的字符串太长而无法容纳在可用空间中，则 SwiftUI 将截断文本，使其以“...”结尾。

您可以调整 SwiftUI 截断文本的方式：默认是从末尾删除文本并在其中显示省略号，但是您也可以根据字符串各部分的重要性将省略号放在中间或开头。

例如，这会在中间截断您的文本：

```swift
Text("This is an extremely long string of text that will never fit even the widest of iOS devices even if the user has their Dynamic Type setting as small as is possible, so in theory it should definitely demonstrate truncationMode().")
    .lineLimit(1)
    .truncationMode(.middle)
```

无论您如何截断文本，都将看到文本视图整齐地位于主视图的中心。 这是 `SwiftUI` 的默认行为：除非告知用户将视图放置在其他位置，否则它将相对于屏幕中心进行放置。