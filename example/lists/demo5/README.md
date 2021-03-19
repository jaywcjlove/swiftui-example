如何让用户在列表中移动行？
---

SwiftUI 通过将 `onMove(perform:)` 修饰符附加到列表中的项目上，使我们可以轻松地进入列表中，以便在行中四处移动行，并在发生移动操作时调用我们选择的方法。 该方法需要接受源 `IndexSet` 和目标 `Int`，如下所示：

```swift
func move(from source: IndexSet, to destination: Int) {
    // move the data here
}
```

移动多个项目时，最好先移动后面的项目，这样可以避免移动其他项目并使索引混乱。 幸运的是，Swift的序列具有内置的方式为我们移动索引集，因此我们只需传递参数即可使其正常工作。

例如，我们可以创建一个 `ContentView` 结构，该结构设置三个用户名字符串的数组，并要求 SwiftUI 调用 `move()` 方法来移动它们。 为了激活移动-即使拖动手柄出现-它还向导航视图添加了一个编辑按钮，以便用户可以切换编辑模式。

这是代码：

```swift
struct ContentView: View {
    @State private var users = ["Paul", "Taylor", "Adele"]

    var body: some View {
        NavigationView {
            List {
                ForEach(users, id: \.self) { user in
                    Text(user)
                }
                .onMove(perform: move)
            }
            .toolbar {
                #if !os(macOS)
                EditButton()
                #else
                Button("Show details") {
                    print("Image tapped!")
                }
                #endif
            }
        }
    }

    func move(from source: IndexSet, to destination: Int) {
        users.move(fromOffsets: source, toOffset: destination)
    }
}
```