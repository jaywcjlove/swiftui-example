如何使用 `labelsHidden()` 隐藏 `Picker`，`Stepper`，`Toggle` 等标签？
---

SwiftUI 要求我们在其控件中添加标签，并且通常希望隐藏这些标签，以便获得更精确的 UI 布局。 但是，隐藏标签的方法很不好，也很不错，尽管人们积极地伤害了用户，但人们还是选择了错误的选择，这已经很普遍了。

首先，让我们看一下隐藏标签的正确方法。 举例来说，以下是一个选择器，可让用户选择一个数字：

```swift
struct ContentView: View {
    @State private var selectedNumber = 0

    var body: some View {
        Picker("选择数字", selection: $selectedNumber) {
            ForEach(0..<10) {
                Text("\($0)")
            }
        }
    }
}
```

默认情况下，它将在左侧显示 `选择数字`，在右侧（至少在iOS上）显示轮式选择器。 这看起来很糟糕，因为标签挤在一个很小的空间中–更好的主意是让 `VStack` 带有自定义文本标签，然后将标签隐藏在 `Picker` 中。

要隐藏 `Picker` 的标签-或实际上是 `DatePicker`，`Stepper`，`Toggle` 或任何其他需要标签的视图的标签 - 您应在该视图中添加 `labelsHidden()` 修饰符，如下所示：

```swift
struct ContentView: View {
    @State private var selectedNumber = 0

    var body: some View {
        Picker("Select a number", selection: $selectedNumber) {
            ForEach(0..<10) {
                Text("\($0)")
            }
        }
        .labelsHidden()        
    }
}
```

这样仍会创建标签，但现在不会显示。 结果，您可以将 `Picker` 放入 `VStack` 并添加您自己选择的标签。

提示：如果要隐藏所有标签，则可以将 `labelsHidden()` 修饰符应用于 `VStack` 或用作外部容器的任何容器。

如果您好奇，则隐藏标签的错误方法是使用 `EmptyView`，如下所示：

```swift
struct ContentView: View {
    @State private var selectedNumber = 0
    var body: some View {
        Picker(selection: $selectedNumber, label: EmptyView()) {
            ForEach(0..<10) {
                Text("\($0)")
            }
        }
    }
}
```

是的，最终结果可能看起来一样，但是使用 `labelsHidden()` 更好的一个重要原因是：屏幕阅读器仍然可以访问隐藏的标签，因此即使文本不可见，它仍然可以帮助 `VoiceOver` 了解您的用户界面的结构。
