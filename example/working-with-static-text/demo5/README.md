如何在文字中的字母之间增加空格？
===

SwiftUI 为我们提供了两个修饰符来控制文本视图内字符的间距，从而使我们可以根据需要将字母间距更紧密或更远。

这两个修饰符是 `tracking()` 和 `kerning()`：两者都增加了字母之间的间距，但是 `tracking` 会拉开连字，而 `kerning` 不会，而 `kerning` 会留下一些尾随空白，而 `tracking` 不会。

因此，这将为 “ Hello World” 增加20个跟踪点，这将使字母之间的间距相当大：

```swift
Text("Hello World")
    .tracking(20)
```

如果您想真正了解字距调整和跟踪有何不同，请尝试以下操作：

```swift
struct ContentView: View {
    @State private var amount: CGFloat = 50

    var body: some View {
        VStack {
            Text("ffi")
                .font(.custom("AmericanTypewriter", size: 72))
                .kerning(amount)
            Text("ffi")
                .font(.custom("AmericanTypewriter", size: 72))
                .tracking(amount)

            Slider(value: $amount, in: 0...100) {
                Text("Adjust the amount of spacing")
            }
        }
    }
}
```

它使用了 `American Typewriter` 中的文本字符串“ ffi”，该字符串具有连字格式，使字母组合看起来更好。 由于跟踪将连字分开，字距调整也不会分开，因此当您向上调整滑块时，第一个文本看起来更像“ f fi”，第二个文本看起来更像“ f f i”。