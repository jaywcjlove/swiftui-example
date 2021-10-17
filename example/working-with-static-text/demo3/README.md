如何使用 multilineTextAlignment() 调整文本对齐方式
===

当 `SwiftUI` 的 “Text” 视图跨多行换行时，默认情况下它们会对齐其前沿。 如果要更改此设置，请使用 `multilineTextAlignment()` 修饰符指定其他选项，例如 `.center` 或 `.trailing`。

例如，这将使多行文本跨行居中：

```swift
Text("This is an extremely long text string that will never fit even the widest of phones without wrapping")
    .font(.largeTitle)
    .multilineTextAlignment(.center)
    .frame(width: 300)
```

您可以使用如下所示的选择器并排比较所有三个文本对齐方式：

```swift
struct ContentView: View {
    let alignments: [TextAlignment] = [.leading, .center, .trailing]
    @State private var alignment = TextAlignment.leading

    var body: some View {
        VStack {
            Picker("Text alignment", selection: $alignment) {
                ForEach(alignments, id: \.self) { alignment in
                    Text(String(describing: alignment))
                }
            }

            Text("This is an extremely long text string that will never fit even the widest of phones without wrapping")
                .font(.largeTitle)
                .multilineTextAlignment(alignment)
                .frame(width: 300)
        }
    }
}
```