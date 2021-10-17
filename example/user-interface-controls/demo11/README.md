如何创建拨动开关？
===

SwiftUI的切换功能使用户可以在真假状态之间切换，就像UIKit中的UISwitch一样。

例如，我们可以创建一个切换器，该切换器是否显示消息取决于切换器是否已启用，但是我们当然不需要手动跟踪切换器的状态–我们希望SwiftUI能够执行此操作 对我们来说。

相反，我们应该定义一个@State布尔属性，该属性将用于存储切换的当前值。 然后，我们可以根据需要使用它来显示或隐藏其他视图。

例如：

```swift
struct ContentView: View {
    @State private var showGreeting = true

    var body: some View {
        VStack {
            Toggle("Show welcome message", isOn: $showGreeting)

            if showGreeting {
                Text("Hello World!")
            }
        }
    }
}
```

我已经编写了该代码，以便仅当 `showGreeting` 为 `true` 时才返回文本视图，这意味着当 `showGreeting` 为 `false` 时 `VStack` 的大小将减小–堆栈中没有第二个视图。

如果需要，可以使用 `toggleStyle()` 修饰符来自定义用于创建切换开关的颜色。 这很有用，因为 `Toggle` 视图无法与 `accentColor()` 一起使用，因此这是为其重新着色的唯一方法。

例如，这将创建一个红色切换：

```swift
struct ContentView: View {
    @State private var showGreeting = true

    var body: some View {
        VStack {
            Toggle("Show welcome message", isOn: $showGreeting)
                .toggleStyle(SwitchToggleStyle(tint: .red))

            if showGreeting {
                Text("Hello World!")
            }
        }
    }
}
```

在 macOS 中 `SwitchToggleStyle` 和 `CheckboxToggleStyle` 两个完全是不一样的控件样式