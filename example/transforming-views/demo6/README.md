如何创建行军蚂蚁边框动画效果？
----

对破折号参数使用 `[10]` 表示 `SwiftUI` 将绘制笔划的 `10` 点，然后绘制 `10` 点的空间，重复该模式直到整个矩形都被描边。 这是一个数组，因为您可以提供多个值，例如 `[10，5]`，以表示“每10个笔划，然后是5个点的间隙”。

当您在破折号阶段中添加时，这才变得真正有趣，该阶段指示了破折号和间隙应放置的位置。 如果将相位存储在状态属性中，则可以随时间对该值进行动画处理，以创建所谓的行进蚂蚁效果-围绕形状移动的虚线笔划，通常用于表示对象选择。

在代码中，它看起来像这样：

```swift
struct ContentView: View {
    @State private var phase: CGFloat = 0
    var body: some View {
        Rectangle()
            .strokeBorder(style: StrokeStyle(lineWidth: 4, dash: [10], dashPhase: phase))
            .frame(width: 200, height: 200)
            .onAppear {
                withAnimation(Animation.linear.repeatForever(autoreverses: false)) {
                    phase -= 20
                }
            }
    }
}
```