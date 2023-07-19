如何用事务覆盖动画？
===

SwiftUI 提供了 `withTransaction()` 函数，该函数允许我们在运行时覆盖动画，例如，删除隐式动画并将其替换为自定义内容。

例如，此代码在小号和大号之间切换一些文本，并且由于附加了隐式动画，因此始终进行动画处理：

```swift
struct ContentView: View {
    @State private var isZoomed = false

    var body: some View {
        VStack {
            Button("Toggle Zoom") {
                isZoomed.toggle()
            }

            Spacer()
                .frame(height: 100)

            Text("Zoom Text")
                .font(.title)
                .scaleEffect(isZoomed ? 3 : 1)
                .animation(.easeInOut(duration: 2))
        }
    }
}
```

`Transactions` 使我们可以逐案地覆盖现有动画。 例如，您可能决定在特定情况下希望文本的动画以快速，线性的方式发生，而不是现有的动画。

为此，请首先使用所需的动画创建一个新的 `Transaction` 实例，然后将其 `disablesAnimations` 值设置为 `true`，以便覆盖将应用的所有现有动画。 准备就绪后，请使用事务对象调用 `withTransaction()`，然后继续调整您要更改的所有状态-这一切都将使用你的事务来动画化。

为了演示这一点，这里是我们相同的文本缩放示例代码，除了使用事务来插入自定义动画以覆盖隐式动画之外，它还包括：

```swift
struct ContentView: View {
    @State private var isZoomed = false

    var body: some View {
        VStack {
            Button("Toggle Zoom") {
                var transaction = Transaction(animation: .linear)
                transaction.disablesAnimations = true

                withTransaction(transaction) {
                    isZoomed.toggle()
                }
            }

            Spacer()
                .frame(height: 100)

            Text("Zoom Text")
                .font(.title)
                .scaleEffect(isZoomed ? 3 : 1)
                .animation(.easeInOut(duration: 2))
        }
    }
}
```

为了获得更多控制，您可以将 `transaction()` 修饰符附加到所需的任何视图，从而允许您覆盖应用于该视图的所有事务。

例如，我们可以在示例中添加第二个缩放文本视图，仍然使用事务来触发缩放动画，但这次我们将在第二个文本视图上使用 `transaction()` 修饰符，以禁用该视图上的任何事务–实际上，我们正在覆盖替代项：

```swift
struct ContentView: View {
    @State private var isZoomed = false

    var body: some View {
        VStack {
            Button("Toggle Zoom") {
                var transaction = Transaction(animation: .linear)
                transaction.disablesAnimations = true

                withTransaction(transaction) {
                    isZoomed.toggle()
                }
            }

            Spacer()
                .frame(height: 100)

            Text("Zoom Text 1")
                .font(.title)
                .scaleEffect(isZoomed ? 3 : 1)

            Spacer()
                .frame(height: 100)

            Text("Zoom Text 2")
                .font(.title)
                .scaleEffect(isZoomed ? 3 : 1)
                .transaction { t in
                    t.animation = .none
                }
        }
    }
}
```
