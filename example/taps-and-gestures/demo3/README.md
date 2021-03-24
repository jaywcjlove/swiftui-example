如何使用 `highPriorityGesture()` 强制一个手势先识别另一个手势？
---

如果您在另一个视图中有一个 `SwiftUI` 视图，并且两个视图都具有相同的手势识别器，则系统将始终在父级之前在子级上触发识别器。 您可以使用 `highPriorityGesture()` 更改此行为，这将强制系统将一个手势优先于另一个手势。

例如，我们可以编写一些代码在 `VStack` 中放置一个圆圈，从而提供一个简单的轻击手势动作。 在这种情况下，圈子的手势动作将始终被触发：

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Circle()
                .fill(Color.red)
                .frame(width: 200, height: 200)
                .onTapGesture {
                    print("Circle tapped")
                }
        }
        .onTapGesture {
            print("VStack tapped")
        }
    }
}
```

如果要触发 `VStack` 手势代替圆的手势，则需要使用 `highPriorityGesture()` 替换 `onTapGesture()` 修饰符，如下所示：

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Circle()
                .fill(Color.red)
                .frame(width: 200, height: 200)
                .onTapGesture {
                    print("Circle tapped")
                }
        }
        .highPriorityGesture(
            TapGesture()
                .onEnded { _ in
                    print("VStack tapped")
                }
        )
    }
}
```

使用此替代方法时，将始终打印 `VStack tapped`，因为 `VStack` 识别器将始终优先于圈子的优先级。