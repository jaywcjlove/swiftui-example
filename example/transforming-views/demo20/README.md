使用 ProgressViewStyle 自定义 ProgressView
===

SwiftUI 为我们提供了 `ProgressViewStyle` 协议，可为 `ProgressView` 创建自定义设计，从而使我们能够阅读进度视图的完整程度，并在设计中将其考虑在内。

要创建自定义的 `ProgressView` 样式，您需要创建一个具有 `makeBody()` 方法的结构，该结构接受视图的当前配置。 然后，您可以继续并根据需要渲染进度（也许是文本百分比，或者是不断增大的圆圈，依此类推），然后返回完成的布局以进行渲染。

为了说明这一点，下面是一种自定义样式，该样式创建了一个量规，将进度显示为笔划的圆圈，并随着进度的增加而逐渐完善：

```swift
struct GaugeProgressStyle: ProgressViewStyle {
    var strokeColor = Color.blue
    var strokeWidth = 25.0

    func makeBody(configuration: Configuration) -> some View {
        let fractionCompleted = configuration.fractionCompleted ?? 0

        return ZStack {
            Circle()
                .trim(from: 0, to: CGFloat(fractionCompleted))
                .stroke(strokeColor, style: StrokeStyle(lineWidth: CGFloat(strokeWidth), lineCap: .round))
                .rotationEffect(.degrees(-90))
        }
    }
}

// 允许您通过点击手势调整进度的视图
struct ContentView: View {
    @State private var progress = 0.2

    var body: some View {
        ProgressView(value: progress, total: 1.0)
            .progressViewStyle(GaugeProgressStyle())
            .frame(width: 200, height: 200)
            .contentShape(Rectangle())
            .onTapGesture {
                if progress < 1.0 {
                    withAnimation {
                        progress += 0.2
                    }
                }
            }
    }
}
```

请注意，我的自定义样式是如何将圆逆时针旋转90度，以便圆从顶部开始绘制。