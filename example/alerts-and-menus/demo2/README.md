如何显示警报？
---

SwiftUI 提供了两种显示警报的方式，具体取决于您是要在布尔值变为true还是设置可选值时显示警报。

创建基本 SwiftUI 警报的代码如下所示：

```swift
Alert(title: Text("Important message"), message: Text("Wear sunscreen"), dismissButton: .default(Text("Got it!")))
```

就像在 `UIAlertController` 中看到的那样，它定义了标题和消息，然后添加了具有默认样式和文本 `知道了！` 的关闭按钮。

为了显示警报，第一种方法是定义某种可绑定条件，该条件确定警报是否可见。 然后，将其附加到您的主视图，该主视图在条件为真时立即显示该警报。

例如，此代码创建一个 `showingAlert` 布尔值，该值跟踪是否应显示防晒霜消息，在点击按钮时将该 `Boolean` 设置为 `true`，然后使用该布尔值创建并附加警报视图，以便在点击按钮时显示该警告视图 ：

```swift
struct ContentView: View {
    @State private var showingAlert = false

    var body: some View {
        Button("Show Alert") {
            showingAlert = true
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Important message"), message: Text("Wear sunscreen"), dismissButton: .default(Text("知道了！")))
        }
    }
}
```

提示：按下这样的警报时，在点击关闭按钮时，`showingAlert` 会自动设置为 `false`。

创建警报的第二种方法是绑定到符合 `Identifiable` 的某些可选状态，这将导致在对象的值更改时显示警报。

此方法有两个优点：

- 您可以在运行时附加任何您喜欢的对象，因此您的警报可以显示任意数量的不同数据。
- SwiftUI在有值时会自动将其拆包，因此您可以确定要在显示警报之前将其存在 - 无需自己检查和拆包该值。

例如，根据选择的电视节目，这将显示一个具有两个不同值的警报：

```swift
struct TVShow: Identifiable {
    var id: String { name }
    let name: String
}

struct ContentView: View {
    @State private var selectedShow: TVShow?

    var body: some View {
        VStack(spacing: 20) {
            Text("What is your favorite TV show?")
                .font(.headline)

            Button("Select Ted Lasso") {
                selectedShow = TVShow(name: "Ted Lasso")
            }

            Button("Select Bridgerton") {
                selectedShow = TVShow(name: "Bridgerton")
            }
        }
        .alert(item: $selectedShow) { show in
            Alert(title: Text(show.name), message: Text("Great choice!"), dismissButton: .cancel())
        }
    }
}
```