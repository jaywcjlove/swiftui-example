如何使用 `trim()` 绘制实体形状的一部分？
---

SwiftUI 允许我们使用其 `trim()` 修饰符仅绘制笔触的一部分或填充形状，该修饰符采用两个参数：起始值和终止值，都存储为 0 到 1 之间的 `CGFloat`。

例如，如果您想要一个半圆，则可以这样写：

```swift
Circle()
    .trim(from: 0, to: 0.5)
    .frame(width: 200, height: 200)
```

SwiftUI 绘制其形状，以使 `0` 度直接位于右侧，因此，如果要更改为使其直接向上0度，则应应用 `rotationEffect()` 修饰符。

例如，它使用计时器来调整传递给 `trim()` 的值，以使矩形的笔触随着时间的推移而增长，例如进度指示器：

```swift
struct ContentView: View {
    @State private var completionAmount: CGFloat = 0.0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        Rectangle()
            .trim(from: 0, to: completionAmount)
            .stroke(Color.red, lineWidth: 20)
            .frame(width: 200, height: 200)
            .rotationEffect(.degrees(-90))
            .onReceive(timer) { _ in
                withAnimation {
                    if completionAmount == 1 { 
                        completionAmount = 0
                    } else {
                        completionAmount += 0.2
                    }
                }
            }
    }
}
```

您也可以使用带有填充形状的 `trim()` ，尽管动画时结果有些奇怪。