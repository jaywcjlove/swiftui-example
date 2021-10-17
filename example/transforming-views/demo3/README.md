如何堆叠修改器以创建更高级的效果？
===

您添加到视图中的每个修饰符都会调整其之前的内容，并且您可以多次重复使用这些修饰符。

例如，我们可以在文本视图周围添加填充和背景颜色，然后添加更多填充和其他背景颜色，然后添加更多填充和第三种背景颜色，以产生特殊的效果：

```swift
Text("Forecast: Sun")
    .font(.largeTitle)
    .foregroundColor(.white)
    .padding()
    .background(Color.red)
    .padding()
    .background(Color.orange)
    .padding()
    .background(Color.yellow)
```

这对于阴影之类的东西特别有用，您可以通过根据需要多次重复它们来创建更强的阴影效果。
