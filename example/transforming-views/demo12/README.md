如何圆角化一个视图？
===

任何 `SwiftUI` 视图都可以使用 `cornerRadius()` 修饰符将其角圆化。 这采用一个简单的点数值来控制舍入应该如何发音。

因此，您可以创建一个带有25个圆角的文本视图，如下所示：

```swift
Text("Round Me")
    .padding()
    .background(Color.red)
    .cornerRadius(25)
```

您可以将 `clipShape()` 修饰符与 `Capsule` 一起使用，自动将最短的边缘完全弄圆，如下所示：

```swift
Text("Round Me")
    .padding()
    .background(Color.red)
    .clipShape(Capsule())
```