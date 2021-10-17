如何旋转视图？
===

SwiftUI 的 `rotationEffect()` 修饰符使我们可以使用度数或弧度自由旋转视图。

例如，如果您想将某些文本旋转-90度以使其向上读取，则可以使用以下命令：

```swift
Text("Up we go")
    .rotationEffect(.degrees(-90))
```

如果您更喜欢使用弧度，只需传入 `.radians()` 作为参数，如下所示：

```swift
Text("Up we go")
    .rotationEffect(.radians(.pi))
```

视图旋转是如此之快以至于它实际上是免费的，因此，您甚至可以使用滑块使其互动，如果您想要的话：

```swift
struct ContentView: View {
    @State private var rotation = 0.0
    var body: some View {
        VStack {
            Slider(value: $rotation, in: 0...360)

            Text("Up we go")
                .rotationEffect(.degrees(rotation))
        }
    }
}
```

默认情况下，视图绕其中心旋转，但是如果您想固定从特定点开始的旋转，则可以为此添加一个额外的参数。 例如，如果您想使滑块上方围绕视图的左上角旋转旋转，则可以这样编写：

```swift
struct ContentView: View {
    @State private var rotation = 0.0

    var body: some View {
        VStack {
            Slider(value: $rotation, in: 0...360)

            Text("Up we go")
                .rotationEffect(.degrees(rotation), anchor: .topLeading)
        }
    }
}
```