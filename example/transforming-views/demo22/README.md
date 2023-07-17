如何更改`List`、`TextEditor`等的背景色
===

有些 `SwiftUI` 视图具有默认的背景颜色，会覆盖你自己尝试应用的任何背景颜色，但如果你使用 `scrollContentBackground()` 修饰符，你可以隐藏该默认背景并替换为其他内容。截至撰写本文时，此方法适用于 `List` 、 `TextEditor和Form` ，因此你可以移除或更改它们的背景颜色。

例如，这将删除列表的默认背景，并替换为靛蓝色：

```swift
List(0..<100) { i in
    Text("Example \(i)")
}
.scrollContentBackground(.hidden)
.background(.indigo)
```

这将隐藏 `TextEditor` 的默认背景并用渐变色替换它：

```swift
struct ContentView: View {
    @State private var bio = "Describe yourself"

    var body: some View {
        TextEditor(text: $bio)
            .scrollContentBackground(.hidden)
            .background(.linearGradient(colors: [.white, .gray], startPoint: .top, endPoint: .bottom))
    }
}
```
