如何使用 `sequenced(before:)` 创建手势链？
===

SwiftUI 允许我们从其他手势序列中创建新手势，这使我们仅在两个手势背靠背出现时才触发动作-例如，如果用户拖动视图然后在其上长按。

由于排序后的视图需要能够相互引用，因此您无法真正将它们创建为视图的属性。 而是直接在您的body属性内创建它们，然后使用 `firstGesture.sequenced(before: secondGesture)` 将两者链接在一起成为一个手势。

例如，下面的代码要求您长按文本视图，然后再拖动它：

```swift
struct ContentView: View {
    @State private var message = "Long press then drag"

    var body: some View {
        let longPress = LongPressGesture()
            .onEnded { _ in
                message = "Now drag me"
            }

        let drag = DragGesture()
            .onEnded { _ in
                message = "Success!"
            }

        let combined = longPress.sequenced(before: drag)

        Text(message)
            .gesture(combined)
    }
}
```

如您所见，当两个手势同时发生时，我已使文本视图更新，因此，如果您尝试一下，便可以跟踪手势序列的进度。