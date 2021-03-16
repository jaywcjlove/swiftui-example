如何延迟动画？
----

当您创建任何动画（隐式，显式或使用绑定）时，可以将修饰符附加到该动画以调整其工作方式。 例如，如果希望动画在一定秒数后开始播放，则应使用 `delay()`修饰符。

例如，这将创建一个红色矩形，在点击该矩形时，它将使用两秒钟的动画（延迟一秒钟）旋转360度：

```swift
struct ContentView: View {
    @State var rotation = 0.0

    var body: some View {
        Rectangle()
            .fill(Color.red)
            .frame(width: 200, height: 200)
            .rotationEffect(.degrees(rotation))
            .animation(Animation.easeInOut(duration: 3).delay(1))
            .onTapGesture {
                rotation += 360
            }
    }
}
```