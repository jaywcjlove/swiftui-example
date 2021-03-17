

`SwiftUI` 具有用于创建重叠内容的专用堆栈类型，例如，如果您想在图片上放置一些文本，则很有用。 它称为 `ZStack` ，其工作方式与其他两种堆栈类型相同。

例如，我们可以在一些文本下方放置一个大图像，如下所示：

```swift
ZStack {
    Image("niagara-falls")
    Text("Hacking with Swift")
        .font(.largeTitle)
        .background(Color.black)
        .foregroundColor(.white)
}
```

像其他堆栈类型一样，`ZStack` 可以通过对齐方式创建，这样它就不会始终将其内部居中放置：

```swift
ZStack(alignment: .leading) {
    Image("niagara-falls")
    Text("Hacking with Swift")
        .font(.largeTitle)
        .background(Color.black)
        .foregroundColor(.white)
}
```

但是，它没有间距属性，因为它没有意义。 相反，您应该使用 `offset()` 修饰符，[如如何使用其偏移量调整视图的位置中所示](transforming-views/demo1)。