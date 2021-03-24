如何在单个视图中显示多个 `alert`？
---

SwiftUI 使得显示单个警报相对容易，但是，如果您尝试从单个视图中显示两个或多个警报，则事情将变得更加棘手-例如，您可能会发现一个警报有效而另一个警报无效。

要解决此问题，您需要确保在每个视图上附加不超过一个 `alert()` 修饰符。 听起来可能有限制，但请记住：您无需将警报附加到同一视图–您可以将它们附加在任何地方。 实际上，您可能会发现将它们直接附加到显示它们的内容（例如按钮）上最适合您。

例如，我们可以编写一些代码定义两个 `@State` 属性，每个属性控制显示的警报。 与其将两个 `alert()` 修饰符都附加到同一个 `VStack` 上，不如将它们分别附加到负责显示该警告的任何按钮上：

```swift
struct ContentView: View {
    @State private var showingAlert1 = false
    @State private var showingAlert2 = false

    var body: some View {
        VStack {
            Button("Show 1") {
                showingAlert1 = true
            }
            .alert(isPresented: $showingAlert1) {
                Alert(title: Text("One"), message: nil, dismissButton: .cancel())
            }

            Button("Show 2") {
                showingAlert2 = true
            }
            .alert(isPresented: $showingAlert2) {
                Alert(title: Text("Two"), message: nil, dismissButton: .cancel())
            }
        }
    }
}
```

如果您尝试将两个 `alert()` 修饰符都移至 `VStack`，则会发现只有一个起作用，这就是上述方法如此有用的原因。