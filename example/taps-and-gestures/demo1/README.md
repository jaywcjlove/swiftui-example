如何在视图中添加手势识别器？
===

任何 `SwiftUI` 视图都可以连接手势识别器，而这些手势识别器又可以连接将在识别器激活时运行的闭包。

有几个手势识别器可以使用，我将为您提供其中几个的代码示例，以帮助您入门 - 您将看到它们的相似之处。

首先是 `TapGesture`。 创建此对象时，您可以指定触发手势所需的轻击次数，然后附加一个 `onEnded` 闭合，该闭合将在手势发生时运行。 例如，这样创建的图像每次被点击都会变小：

```swift
struct ContentView: View {
    @State private var scale: CGFloat = 1.0

    var body: some View {
        Image("ireland")
            .scaleEffect(scale)   
            .gesture(
                TapGesture()
                    .onEnded { _ in
                        scale -= 0.1
                    }
            )
    }
}
```

其次，`LongPressGesture` 可以识别用户何时按下并按住视图至少指定的时间。 因此，这样创建的图像视图在按下至少一秒钟时会减小一半：

```swift
struct ContentView: View {
    @State private var scale: CGFloat = 1.0

    var body: some View {
        Image("cornwall")
            .scaleEffect(scale)
            .gesture(
                LongPressGesture(minimumDuration: 1)
                    .onEnded { _ in
                        scale /= 2
                    }
            )
    }
}
```

最后，当用户在视图上按下并移动至少一定距离时，`DragGesture` 将触发。 因此，这将创建具有拖动手势的图像，当用户将其移动至少50点时将触发该图像：

```swift
struct ContentView: View {
    @State private var dragCompleted = false

    var body: some View {
        VStack {
            Image("iceland")
                .gesture(
                    DragGesture(minimumDistance: 50)
                        .onEnded { _ in
                            dragCompleted = true
                        }
                )

            if dragCompleted {
                Text("Drag completed!")
            }
        }
    }
}
```

与 `offset()` 修饰符结合使用时，拖动手势特别好，它可以让我们调整视图的自然位置。 例如，这使用 `dragOffset` 大小来偏移图像，该大小本身附加到拖动手势：

```swift
struct ContentView: View {
    @State private var dragOffset = CGSize.zero

    var body: some View {
        VStack {
            Image("rome")
                .offset(dragOffset)
                .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            dragOffset = gesture.translation
                        }
                        .onEnded { gesture in
                            dragOffset = .zero
                        }
                )
        }
    }
}
```

如果您尝试使用该代码，则会看到可以立即拖动图像，并且在松开手指时，它将捕捉回到原始位置。