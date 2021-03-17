什么时候应该使用 `ContainerRelativeShape`？
---

SwiftUI 具有许多不言自明的内置形状，但其中一个引人注目：`ContainerRelativeShape`。 这不是固定的形状，而是旨在成为放置在其中的任何形状的固定版本，这在创建主屏幕小部件时尤其重要。

重要提示：目前，`ContainerRelativeShape` 仅在窗口小部件内起作用。 您可以在其他地方使用它，但它只会形成一个矩形。

例如，我们可以编写代码在窗口小部件中绘制蓝色形状，然后使用 `ContainerRelativeShape` 来确保其形状与窗口小部件本身相同：

```swift
struct ContentView: View {    
    var body: some View {
        ZStack {
            ContainerRelativeShape()
                .inset(by: 4)
                .fill(Color.blue)

            Text("Hello, World!")
                .font(.title)
        }
        .frame(width: 300, height: 200)
        .background(Color.red)
        .clipShape(Capsule())
    }
}
```