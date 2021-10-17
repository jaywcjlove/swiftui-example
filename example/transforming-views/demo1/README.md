如何使用其偏移量调整视图的位置 `offset`？
===

所有视图在层次结构中都具有自然位置，但是 `offset()` 修饰符使您可以相对于该自然位置移动它们。 这在ZStack内部特别有用，可以在其中控制视图的重叠方式。

重要提示：使用 `offset()` 将使视图相对于其自然位置移动，但不会影响其他视图的位置或在偏移之后放置的任何其他修改器的位置。 这意味着您需要仔细考虑如何使用它，尤其是要使视图不重叠时（并非出于您的意图）。

例如，在此 `VStack` 中，我们可以使用 `offset()` 将第二项向下移动15点，以便它开始与第三项重叠：

```swift
VStack {
  Text("Home")
  Text("Options")
      .offset(y: 15)
  Text("Help")
}
```

您通常会发现，将 `padding()` 与 `offset()` 结合使用可为您提供所需的结果，因为它可以移动一个视图，同时还可以调整其旁边的视图以匹配。

例如，这会将第二项下移15个点，但在其底部边缘增加15个填充点，以使其与下面的文本视图不重叠：

```swift
VStack {
    Text("Home")
    Text("Options")
        .offset(y: 15)
        .padding(.bottom, 15)
    Text("Help")
}
```

正如我之前所说，在 `offset()` 之后放置的所有修饰符都不会受到位置变化的影响，这可能会导致意外结果。 在下面的示例中，我在偏移之前和之后都使用了 `background()` ，因此您可以看到它们之间的不同：

```swift
HStack {
    Text("Before")
        .background(Color.red)
        .offset(y: 15)

    Text("After")
        .offset(y: 15)
        .background(Color.red)
}
```

当与 `ZStack` 结合使用时，偏移使我们可以将一个视图放置在另一个视图内，这在控制 `ZStack` 的对齐方式时特别有用。

例如，如果我们有一个 `ZStack` 显示照片和摄影师的名字，我们可以使用 `.bottomTrailing` 对齐方式来使图像占用所有可用空间，同时使信用额度位于右下角，然后使用 `offset(x: -5, y:-5)` 将信用额度拉回 5 个点：

```swift
ZStack(alignment: .bottomTrailing) {
    Image("scotland")
    Text("Photo credit: Paul Hudson.")
        .padding(4)
        .background(Color.black)
        .foregroundColor(.white)
        .offset(x: -5, y: -5)
}
```

将 `offset` 放置在其它修饰符的末尾可确保它们一起移动。
