如何为 `alert` 按钮添加动作？
===

基本的SwiftUI警报如下所示：

```swift
Alert(title: Text("Important message"), message: Text("Wear sunscreen"), dismissButton: .default(Text("Got it!")))
```

但是，您经常需要将动作附加到按钮上，以便在点击它们时执行特定的动作。 为此，请在您的按钮上附加一个闭包，当您点击按钮时将其关闭，如下所示：

```swift
struct ContentView: View {
    @State private var showingAlert = false

    var body: some View {
        Button("Show Alert") {
            showingAlert = true
        }
        .alert(isPresented:$showingAlert) {
            Alert(
                title: Text("Are you sure you want to delete this?"),
                message: Text("There is no undo"),
                primaryButton: .destructive(Text("Delete")) {
                    print("Deleting...")
                },
                secondaryButton: .cancel()
            )
        }
    }
}
```

无法为警报添加两个以上的按钮 - 如果您要这样做，则应改用操作表。
