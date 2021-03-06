如何用一个视图掩盖另一个视图？
===

SwiftUI为我们提供了 `mask()` 修饰符，可用于彼此遮盖，这意味着您可以使用文本遮盖图像，也可以使用图像遮盖图像，甚至更多。

例如，这将创建一个 `300x300` 的条纹图像，然后使用文本 “SWIFT!” 对其进行遮罩。 这样，字母就可以作为图像的切出部分：

```swift
Image("laser-show")
    .resizable()
    .frame(width: 300, height: 300)
    .mask(Text("SWIFT!")
        .font(.system(size: 72)))
```

`mask()` 修饰符与 `clipShape()` 不同，因为它也可以应用蒙版视图中的任何透明度–基于蒙版的透明度，您在基础视图中会出现孔。 另一方面，`clipShape()` 仅调整将其应用到的视图的外部形状。