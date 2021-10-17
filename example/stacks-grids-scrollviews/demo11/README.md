如何使用 `ScrollView` 和 `GeometryReader` 创建3D效果(如Cover Flow)？
===

如果将 `GeometryReader` 与任何可以改变位置的视图（例如具有拖动手势或位于 `List` 内的视图）结合使用，我们可以创建在屏幕上看起来很棒的3D效果。`GeometryReader` 允许我们读取视图的坐标，并将这些值直接输入到 `rotation3DEffect()` 修饰符中。

例如，我们可以通过在滚动视图中水平堆叠许多文本视图，然后应用 `rotation3DEffect()` 来创建 `Cover Flow` 样式的滚动效果，这样当它们在滚动视图中移动时，它们会缓慢地旋转，如下所示：

```swift
ScrollView(.horizontal, showsIndicators: false) {
    HStack(spacing: 0) {
        ForEach(1..<20) { num in
            VStack {
                GeometryReader { geo in
                    Text("Number \(num)")
                        .font(.largeTitle)
                        .padding()
                        .background(Color.red)
                        .rotation3DEffect(.degrees(-Double(geo.frame(in: .global).minX) / 8), axis: (x: 0, y: 1, z: 0))
                        .frame(width: 200, height: 200)
                }
                .frame(width: 200, height: 200)
            }
        }
    }
}
```

您不必总是使用 `GeometryReader` 来获得有趣的效果，例如，可以使用 `DragGesture()` 进行类似的处理。 因此，此代码创建了一个可以在 `X` 和 `Y` 轴上拖动的类似于卡片的矩形，并使用了两个 `rotation3DEffect()` 修饰符从该拖动中应用值：

```swift
struct ContentView: View {
    @State var dragAmount = CGSize.zero

    var body: some View {
        VStack {
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: 200, height: 150)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .rotation3DEffect(.degrees(-Double(dragAmount.width) / 20), axis: (x: 0, y: 1, z: 0))
                .rotation3DEffect(.degrees(Double(dragAmount.height / 20)), axis: (x: 1, y: 0, z: 0))
                .offset(dragAmount)
                .gesture(
                    DragGesture()
                        .onChanged { dragAmount = $0.translation }
                        .onEnded { _ in
                            withAnimation(.spring()) {
                                dragAmount = .zero
                            }
                        }
                )
        }
        .frame(width: 400, height: 400)
    }
}
```

拖动卡片时，会看到它旋转以产生透视效果。