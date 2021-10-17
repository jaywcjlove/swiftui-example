如何在 SwiftUI 中使用程序化导航？
===

我们可以使用 `SwiftUI` 通过 `NavigationLink` 将新视图以编程方式推送到 `NavigationView` 上，这意味着我们可以在准备就绪时触发导航，而不仅仅是在用户点击按钮或列表行时触发导航。

有两种方法，两种方法都依赖于 `NavigationLink` 的初始化程序。 第一个是将 `NavigationLink` 绑定到布尔状态-当该布尔值变为 `true` 时，导航将立即发生，而当布尔值变为 `false` 时，新视图将被关闭。

SwiftUI 确实要求我们即使在进行程序化导航时也需要将某种视图传递给 `NavigationLink`。 您可能想使用 `EmptyView` 完全不显示任何内容，例如，下面是一个完整的程序化导航示例，其中我在按下按钮时切换了布尔值：

```swift
struct ContentView: View {
    @State private var isShowingDetailView = false
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: Text("Second View"), isActive: $isShowingDetailView) { EmptyView() }

                Button("Tap to show detail") {
                    isShowingDetailView = true
                }
            }
            .navigationTitle("Navigation")
        }
    }
}
```

与简单的 `NavigationLink` 相比，此方法的优势在于，我们的按钮可以在触发程序化导航之前完成任何其他工作 - 也许您想保存一些数据或对用户进行身份验证等。

如果您有多个可能的目的地，则可以将多个 `NavigationLink` 绑定到某个选择状态，并为每个状态赋予唯一的标签。 当您更新选择状态以匹配这些标签之一时，将导致相应的 `NavigationLink` 激活，这使您可以进行多目标程序化导航，而无需使用大量的布尔值。

例如，根据 `selection` 属性的值，它导航到两个目标文本视图之一：

```swift
struct ContentView: View {
    @State private var selection: String? = nil

    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: Text("View A"), tag: "A", selection: $selection) { EmptyView() }
                NavigationLink(destination: Text("View B"), tag: "B", selection: $selection) { EmptyView() }

                Button("Tap to show A") {
                    selection = "A"
                }

                Button("Tap to show B") {
                    selection = "B"
                }
            }
            .navigationTitle("Navigation")
        }
    }
}
```