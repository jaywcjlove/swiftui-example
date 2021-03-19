如何禁用 `Button` 和 `NavigationLink` 中的图像的覆盖颜色？
---

在 `iOS` 上，在 `NavigationLink` 或 `Button` 中绘制的图像几乎肯定不会像您期望的那样工作：整个图像将被覆盖为不透明的蓝色或视图中具有任何强调色的颜色。

有两种方法可以解决此问题； 选择哪种取决于您想要的行为。

首先，您可以使用 `renderingMode()` 模式修饰符来获得略有不同的结果：

```swift
NavigationView {
    NavigationLink(destination: Text("Detail view here")) {
        Image("logo")
            .renderingMode(.original)
    }
}
```

或者，可以将 `buttonStyle()` 修饰符与 `PlainButtonStyle()` 一起使用，如下所示：

```swift
NavigationView {
    NavigationLink(destination: Text("Detail view here")) {
        Image("logo")
    }
    .buttonStyle(PlainButtonStyle())
}
```

或像这样的普通按钮：

```swift
Button {
    // your action here
} label: {
    Image("logo")
}
.buttonStyle(PlainButtonStyle())
```

区别是微妙的，但很重要：如果在列表中使用 `Button`，则使用 `buttonStyle(PlainButtonStyle())` 意味着仅可以敲击按钮内容周围的空间，而如果使用 `.renderingMode(.original)`，则 整个单元保持可轻敲。