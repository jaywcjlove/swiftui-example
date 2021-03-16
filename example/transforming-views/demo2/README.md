如何为视图周围的填充着色？
----

`padding()` 修改器使我们可以在视图周围添加一些间距，而 `background()` 修改器使我们可以设置背景颜色。 但是，使用它们的方式很重要，因此务必明确目标，以便获得最佳结果。

例如，这将创建一个具有黑色背景和白色前景的文本视图，然后向其添加系统默认填充：

```swift
Text("Hacking with Swift")
    .background(Color.red)
    .foregroundColor(.white)
    .padding()
```

这会添加系统默认填充，然后设置黑色背景颜色和白色前景：

```swift
Text("Hacking with Swift")
    .padding()
    .background(Color.red)
    .foregroundColor(.white)
```

这两段代码可能看起来相似，但是它们产生不同的结果，因为应用修饰符的顺序很重要。 在第二个示例中，视图被填充然后被着色，这意味着填充也被着色为黑色。 相比之下，第一个示例将填充颜色，因此填充保持不变色。

因此，如果您希望某些文本的背景颜色比文本本身宽，请确保使用第二个代码示例-先填充然后上色。
