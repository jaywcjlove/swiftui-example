如何设置可编辑文本 `TextEditor` 背景颜色？
---

```swift
extension NSTextView {
    open override var frame: CGRect {
        didSet {
            backgroundColor = .clear
            drawsBackground = true
        }
    }
}

struct ContentView: View {
    @State var text = ""
    var body: some View {
        TextEditor(text: $text)
            .background(Color.red)
    }
}
```