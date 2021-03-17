如何使用 `Spacer` 将视图强制移到堆栈中的一侧？
---

`SwiftUI` 默认情况下将其视图居中，这意味着如果在 `VStack` 中放置三个文本视图，则这三个视图将在屏幕上垂直居中。 如果要更改此设置（如果要强制视图朝屏幕的顶部，底部，左侧或右侧），则应使用 `Spacer` 视图。

例如，这会将一个文本视图放置在 `VStack` 内，这意味着它将垂直居中：

```swift
VStack {
    Text("Hello World")
}
```

要将文本视图推到父视图的顶部，我们需要在其下方放置一个空格，如下所示：

```swift
VStack {
    Text("Hello World")
    Spacer()
}
```

如果您希望在 `HStack` 的前端和后端有两段文字，可以使用这样的间隔符：

```swift
HStack {
    Text("Hello")
    Spacer()
    Text("World")
}
```

`Spacers` 会自动划分所有剩余空间，这意味着如果您使用多个垫片，则可以按不同数量划分空间。

例如，这将通过在其上放置一个空格，在其后放置两个空格，将文本视图放置在其父视图的三分之一以下：

```swift
VStack {
    Spacer()
    Text("Hello World")
    Spacer()
    Spacer()
}
```