如何使用 `layoutPriority()` 控制布局优先级？
---

`SwiftUI` 的 `layoutPriority()` 修饰符可让我们请求在空间有限时在屏幕上为某些视图提供更大的空间。 默认情况下，所有视图的布局优先级均为 `0`，但是如果您发现某个视图被压缩，则可以使用 `layoutPriority()` 要求将其赋予更高的优先级。

例如，以下是两个并排放置的文本：

```swift
struct ContentView: View {
    var body: some View {
        HStack {
            Text("The rain Spain falls mainly on the Spaniards.")
            Text("Knowledge is power, France is bacon.")
        }
        .font(.largeTitle)
    }
}
```

两个文本字符串都足够长，可以在 `iPhone` 上用两行换行，`SwiftUI` 会尝试合理调整它们的大小，以便根据其长度获得适当的空间。

我们可以使用 `layoutPriority()` 修饰符通过使两个字符串之一更重要来更改此设置。 `SwiftUI` 将计算低优先级文本视图所需的最小空间量，然后将剩余空间提供给高优先级文本，以便它可以占用所需的空间。

外观如下：

```swift
struct ContentView: View {
    var body: some View {
        HStack {
            Text("The rain Spain falls mainly on the Spaniards.")
            Text("Knowledge is power, France is bacon.")
                .layoutPriority(1)
        }
        .font(.largeTitle)
    }
}
```

显然，结果取决于您使用的屏幕大小，但是优先级较高的文本视图可能不会使用其提供的所有可用空间，因此其余部分将交给优先级较低的文本视图 使用。