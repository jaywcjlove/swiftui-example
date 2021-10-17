如何创建自定义修改程序？
===

如果您发现自己不断将相同的修改器集附加到视图 - 例如，请给出背景颜色，一些填充，特定字体等 - 然后您可以通过创建封装所有这些更改的自定义视图修改器来避免重复 。 所以，而不是说“让它变红，使它使用一个大字体”等，你可以说“让它看起来像警告”，并应用一组预先制作的修饰符。

如果要自己制作，请定义符合 `ViewModifier` 协议的结构。 此协议要求您接受一个 `body(content:)`，该方法转换某种内容，返回结果。

例如，这会创建一个新的 `PrimaryLabel` 修改器，该修饰程序添加填充，红色背景，白色文本和大字体，然后在视图中使用它：

```swift
struct PrimaryLabel: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color.red)
            .foregroundColor(Color.white)
            .font(.largeTitle)
    }
}

struct ContentView: View {
    var body: some View {
        Text("Hello, SwiftUI")
            .modifier(PrimaryLabel())
    }
}
```