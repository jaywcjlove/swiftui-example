如何使用 redacted() 将内容标记为占位符？
===

SwiftUI 允许我们在视图中将文本标记为占位符，这意味着它会被渲染，但会被灰色掩盖以表明它不是最终内容。 这是通过 `redacted(reason:)` 修饰符以及 `unredacted()` 修饰符提供的，您可以根据需要使用它们覆盖重写。

它在代码中的外观如下：

```swift
Text("This is placeholder text")
    .font(.title)
    .redacted(reason: .placeholder)
```

您只需在容器上使用 `redacted(reason:)`，即可一次在视图中进行多次编辑，如下所示：

```swift
VStack {
    Text("This is placeholder text")
    Text("And so is this")
}
.font(.title)    
.redacted(reason: .placeholder)
```

苹果公司表示，编辑是一个附加过程，这意味着，如果您向父母和孩子都添加编辑原因，那么它们将结合在一起。 目前只有 `.placeholder`，但是将来我们会看到像素化或类似现象吗？

您还可以查询从环境中传入的任何编校原因，如下所示：

```swift
struct ContentView: View {
    @Environment(\.redactionReasons) var redactionReasons
    let bio = "The rain in Spain falls mainly on the Spaniards"

    var body: some View {
        if redactionReasons == .placeholder {
            Text("Loading…")
        } else {
            Text(bio)
                .redacted(reason: redactionReasons)
        }
    }
}
```

提示：使用与上面所示相同的代码，`Redaction` 也可用于图像。