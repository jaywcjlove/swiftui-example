什么是 `@Binding` 属性包装器？
===

`@Binding` 让我们声明一个值实际上来自其他地方，并且应该在两个地方共享。 这与 `@ObservedObject` 或 `@EnvironmentObject` 不同，这两个对象都是为在可能的许多视图之间共享引用类型而设计的。

例如，我们可能有一个带有 `@State` 属性的 `ContentView`，该属性存储是否显示子视图，如下所示：

```swift
struct ContentView: View {
    @State private var showingAddUser = false
    var body: some View {
        VStack {
            // your code here
        }
    }
    .sheet(isPresented: $showingAddUser) {
        // show the add user view
    }
}
```

它使用 `showingAddUser` 作为工作表的 `isPresented` 参数，这意味着当该布尔值变为 `true` 时，将显示添加用户视图。 但是，如果需要，我们如何才能允许添加用户视图自行关闭-例如，如果用户点击“完成”按钮？

我们想要发生的是，将添加用户视图的 `showingAddUser` 设置回 `false`，这将导致 `ContentView` 将其隐藏。 这正是 `@Binding` 的目的：它使我们可以在添加用户视图中创建一个属性，该属性表示“此值将从其他地方提供，并将在我们与其他地方之间共享”。

因此，我们可以创建一个添加用户视图，如下所示：

```swift
struct AddView: View {
    @Binding var isPresented: Bool

    var body: some View {
        Button("Dismiss") {
            isPresented = false
        }
    }
}
```

该属性的字面意思是“我有一个名为 isPresented 的布尔值，但它存储在其他位置。” 因此，当我们创建该 `AddView` 来替换 `// show the add user view`，我们需要提供该值以便可以对其进行操作：

```swift
.sheet(isPresented: $showingAddUser) {
    AddView(isPresented: $showingAddUser)
}
```

这使 `ContentView` 和 `AddView` 可以共享相同的布尔值 - 当它在一个位置更改时，它在另一个位置也更改。