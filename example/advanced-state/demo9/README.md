当使用 `onChange()` 改变状态时如何运行一些代码？
----

SwiftUI 允许我们将 `onChange()` 修饰符附加到任何视图，当程序中的某些状态发生更改时，该修饰符将运行我们选择的代码。 这很重要，因为我们不能总是将诸如 `didSet` 之类的属性观察器与 `@State` 之类一起使用。

例如，这将在键入名称时打印名称更改：

```swift
struct ContentView: View {
    @State private var name = ""
    var body: some View {
        TextField("Enter your name:", text: $name)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .onChange(of: name) { newValue in
                print("Name changed to \(name)!")
            }
    }
}
```

就个人而言，我更喜欢为 `Binding` 添加一个自定义扩展，以便将观察代码直接附加到绑定而不是视图上–它使我可以将观察者放置在它所观察的对象旁边，而不是附加许多 `onChange()` 修饰符 我认为其他地方。

因此，我将使用如下代码：

```swift
extension Binding {
    func onChange(_ handler: @escaping (Value) -> Void) -> Binding<Value> {
        Binding(
            get: { self.wrappedValue },
            set: { newValue in
                self.wrappedValue = newValue
                handler(newValue)
            }
        )
    }
}

struct ContentView: View {
    @State private var name = ""

    var body: some View {
        TextField("Enter your name:", text: $name.onChange(nameChanged))
            .textFieldStyle(RoundedBorderTextFieldStyle())
    }

    func nameChanged(to value: String) {
        print("Name changed to \(name)!")
    }
}
```