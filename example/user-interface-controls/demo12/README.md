如何创建滑块 `Slider` 并从中读取值？
---

SwiftUI 的 `Slider` 视图的工作原理与 `UISlider` 相似，尽管您需要将其绑定到某个位置以便存储其值。

创建它时，可以提供多种参数，但是您可能最关心的参数是：

- `value`：将其绑定到的Double值。
- `in`：滑块的范围。
- `Step`：移动滑块时要更改多少值。 此参数是可选的。

例如，以下代码创建绑定到 `Celsius` 属性的滑块，然后随着滑块的移动更新文本视图，以便在 `Celsius` 和 `Fahrenheit` 之间转换：

```swift
struct ContentView: View {
    @State private var celsius: Double = 0

    var body: some View {
        VStack {
            Slider(value: $celsius, in: -100...100)
            Text("\(celsius, specifier: "%.1f") Celsius is \(celsius * 9 / 5 + 32, specifier: "%.1f") Fahrenheit")
        }
    }
}
```