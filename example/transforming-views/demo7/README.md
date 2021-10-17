如何在视图周围绘制阴影？
===

SwiftUI 为我们提供了专用的 `shadow()` 修饰符，可在视图周围绘制阴影。 您可以控制阴影的颜色，半径和位置，还可以通过调整修改器顺序来控制视图的哪些部分被阴影化。

在其基本形式中，只需指定模糊的半径即可添加阴影，如下所示：

```swift
Text("Hacking with Swift")
    .padding()
    .shadow(radius: 5)
    .border(Color.red, width: 4)
```

这会增加一个非常轻微的阴影，并在文本上居中出现 5 点模糊。

您还可以指定所需的颜色，以及与原始视图的 `X` 和 `Y` 偏移量。 例如，这将以文本为中心创建带有 5 点模糊的强红色阴影：

```swift
Text("Hacking with Swift")
    .padding()
    .shadow(color: .red, radius: 5)
    .border(Color.red, width: 4)
```

如果要为阴影指定偏移量，请向修改器添加 `x` 和 `/` 或 `y` 参数，如下所示：

```swift
Text("Hacking with Swift")
    .padding()
    .shadow(color: .red, radius: 5, x: 20, y: 20)
    .border(Color.red, width: 4)
```

记住，`SwiftUI` 按照列出修饰符的顺序应用修饰符，因此，如果您希望将阴影也应用到边框，只需将 `border` 修饰符放在shadow修饰符之前：

```swift
Text("Hacking with Swift")
    .padding()
    .border(Color.red, width: 4)
    .shadow(color: .red, radius: 5, x: 20, y: 20)
```

提示：如果您发现阴影效果不够强，请添加另一个 `shadow()` 修饰符-您可以将它们叠加起来以创建更复杂的阴影效果。