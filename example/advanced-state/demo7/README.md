如何创建自定义绑定?
----

当我们使用 `SwiftUI` 的 `@State` 属性包装器时，它代表我们进行了大量工作，以允许用户界面控件进行双向绑定。 但是，我们也可以使用 `Binding` 类型手动创建绑定，该类型可以与自定义 `get` 和 `set` 闭包一起提供，以在读取或写入值时运行。

例如，这将创建一个琐碎的绑定，该绑定仅充当另一个属性的传递：

```swift
struct ContentView: View {
    @State private var username = ""

    var body: some View {
        let binding = Binding(
            get: { self.username },
            set: { self.username = $0 }
        )

        return VStack {
            TextField("Enter your name", text: binding)
        }
    }
}
```

提示：绑定到自定义 `Binding` 实例时，无需在绑定名称前使用美元符号-您已经在阅读双向绑定。

当您想为正在读取或写入的绑定添加额外的逻辑时，自定义绑定非常有用–您可能需要在返回值之前执行一些计算，或者在更改值时希望执行一些额外的操作。

例如，我们可以创建一个由两个拨动开关组成的堆栈，两个拨动开关都可以关闭，而一个可以打开，但是两个不能同时打开–启用一个将始终禁用另一个。 这就是代码中的样子：

```swift
struct ContentView: View {
    @State private var firstToggle = false
    @State private var secondToggle = false
    var body: some View {
        let firstBinding = Binding(
            get: { self.firstToggle },
            set: {
                self.firstToggle = $0
                if $0 == true {
                    self.secondToggle = false
                }
            }
        )

        let secondBinding = Binding(
            get: { self.secondToggle },
            set: {
                self.secondToggle = $0
                if $0 == true {
                    self.firstToggle = false
                }
            }
        )

        return VStack {
            Toggle(isOn: firstBinding) {
                Text("First toggle")
            }

            Toggle(isOn: secondBinding) {
                Text("Second toggle")
            }
        }
        .padding(100)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```