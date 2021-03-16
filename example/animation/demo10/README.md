如何创建不对称过渡？
----

`SwiftUI` 让我们在添加视图时指定一个过渡，在删除视图时指定另一个过渡，所有过渡都使用 `asymmetric()` 过渡类型完成。

例如，我们可以创建一个使用非对称过渡的文本视图，这样它在添加时从前边缘移入，而在删除时则向下移至底部边缘，如下所示：

```swift
struct ContentView: View {
    @State private var showDetails = false

    var body: some View {
        VStack {
            Button("Press to show details") {
                withAnimation {
                    showDetails.toggle()
                }
            }

            if showDetails {
                Text("Details go here.")
                    .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .bottom)))
            }
        }

    }
}
```