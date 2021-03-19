如何在 `TextField` 中禁用自动更正？
---

默认情况下，SwiftUI 的 `TextField` 启用自动更正功能，这在大多数情况下都是您所需要的。 但是，如果要禁用它，可以使用 `disableAutocorrection()` 修饰符来执行此操作，如下所示：

```swift
struct ContentView: View {
    @State private var name = ""

    var body: some View {
        TextField("Enter your name", text: $name)
            .disableAutocorrection(true)
    }
}
```