使用 ButtonStyle 自定义按钮？
===

SwiftUI 具有许多样式协议，这些协议使我们能够为诸如 `Button`，`ProgressView`，`Toggle` 等视图定义通用样式。 它们全部通过允许我们集中任意数量的修饰符来使视图看起来像我们想要的方式起作用，并提供修饰符，这些修饰符使我们可以在一行中应用全套定制。

例如，这是一个样式声明为嵌入式的按钮：

```swift
Button("Press Me") {
    print("Button pressed!")
}
.padding()
.background(Color(red: 0, green: 0, blue: 0.5))
.clipShape(Capsule())
```

这对于单个按钮来说效果很好，但是如果这是整个应用程序中的标准按钮设计，则应考虑改用自定义按钮样式。 这意味着创建一个符合 `ButtonStyle` 协议的新结构，该结构将根据需要将按钮的配置传递给我们，以便对其进行操作。

因此，我们可以将这三个修饰符集中到一个 `BlueButton` 样式中，然后将其应用到我们的按钮上，如下所示：

```swift
struct BlueButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color(red: 0, green: 0, blue: 0.5))
            .foregroundColor(.white)
            .clipShape(Capsule())
    }
}

struct ContentView: View {
    var body: some View {
        Button("Press Me") {
            print("Button pressed!")
        }
        .buttonStyle(BlueButton())
    }
}
```
我们传递的按钮配置包括按钮当前是否被按下，因此我们可以使用它来调整按钮。

例如，我们可以创建第二种样式，使按钮在按下时变大：

```swift
struct GrowingButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(.blue)
            .foregroundStyle(.white)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

struct ContentView: View {
    var body: some View {
        Button("Press Me") {
            print("Button pressed!")
        }
        .buttonStyle(GrowingButton())
    }
}
```
