如何使用 `TabView` 将视图嵌入选项卡栏中？
===

SwiftUI 的 `TabView` 提供了与 `UITabBarController` 等效的功能，使我们可以使用屏幕底部的栏让用户在多个活动视图之间切换。

在其基本形式中，应为每个项目提供图像和标题，如果要以编程方式控制哪个选项卡处于活动状态，则还可以选择添加标签。 例如，这将创建两个具有不同图像，标题和标签的视图：

```swift
struct ContentView: View {    
    var body: some View {
        TabView {
            Text("First View")
                .padding()
                .tabItem {
                    Image(systemName: "1.circle")
                    Text("First")
                }
                .tag(1)
            Text("Second View")
                .padding()
                .tabItem {
                    Image(systemName: "2.circle")
                    Text("Second")
                }
                .tag(2)
        }
    }
} 
```

除了单独指定文本和图像，您还可以使用“标签”视图将它们组合在一起：

```swift
struct ContentView: View {
    var body: some View {
        TabView {
            Text("First View")
                .padding()
                .tabItem {
                    Label("First", systemImage: "1.circle")
                }
                .tag(1)

            Text("Second View")
                .padding()
                .tabItem {
                    Label("Second", systemImage: "2.circle")
                }
                .tag(2)
        }
    }
}
```

如果添加标签，则可以通过修改标签页视图的选择来以编程方式控制活动标签页。 在此示例中，我使每个选项卡的内容成为一个更改视图的按钮，方法是添加一些新状态以跟踪哪个选项卡处于活动状态，然后将其附加到 `TabView` 的 `selection` 值：：

```swift
struct ContentView: View {
    @State var selectedView = 1

    var body: some View {
        TabView(selection: $selectedView) {
            Button("Show Second View") {
                selectedView = 2
            }
            .padding()
            .tabItem {
                Label("First", systemImage: "1.circle")
            }
            .tag(1)

            Button("Show First View") {
                selectedView = 1
            }
            .padding()
            .tabItem {
                Label("Second", systemImage: "2.circle")
            }
            .tag(2)
        }
    }
}
```

选项卡的标签可以是任何您想要的，只要数据类型符合 `Hashable`。 整数可能工作得很好，但是如果您要进行任何有意义的程序化导航，则应确保将标签放在中心位置，例如视图内的静态属性。 这使您可以在许多地方共享价值，从而减少出错的风险。