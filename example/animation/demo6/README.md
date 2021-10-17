视图出现后如何立即启动动画？
===

如果希望 `SwiftUI` 视图一出现就立即开始动画处理，则应使用 `onAppear()` 修饰符附加动画。 首先，我将向您展示基本代码，然后再展示两个用来简化此过程的扩展程序。

首先，是简单的版本–这会创建一个永远缩放的圆圈：

```swift
struct ContentView: View {
    @State var scale: CGFloat = 1

    var body: some View {
        Circle()
            .frame(width: 200, height: 200)
            .scaleEffect(scale)
            .onAppear {
                let baseAnimation = Animation.easeInOut(duration: 1)
                let repeated = baseAnimation.repeatForever(autoreverses: true)

                withAnimation(repeated) {
                    scale = 0.5
                }
            }
    }
}
```

如果您打算频繁添加初始动画，则明智的做法是在 `View` 协议中添加一些扩展，以使其变得更容易。

为了说明这一点，下面的两个扩展添加了 `animate()` 和 `animateForever()` 修饰符，使您可以自定义所需的动画并整齐地包装整个行为：


```swift
// Create an immediate animation.
extension View {
    func animate(using animation: Animation = Animation.easeInOut(duration: 1), _ action: @escaping () -> Void) -> some View {
        onAppear {
            withAnimation(animation) {
                action()
            }
        }
    }
}

// Create an immediate, looping animation
extension View {
    func animateForever(using animation: Animation = Animation.easeInOut(duration: 1), autoreverses: Bool = false, _ action: @escaping () -> Void) -> some View {
        let repeated = animation.repeatForever(autoreverses: autoreverses)

        return onAppear {
            withAnimation(repeated) {
                action()
            }
        }
    }
}

// Try out our extensions with the scaling circle.
struct ContentView: View {
    @State var scale: CGFloat = 1

    var body: some View {
        Circle()
            .frame(width: 200, height: 200)
            .scaleEffect(scale)
            .animateForever(autoreverses: true) { scale = 0.5 }
    }
}
```