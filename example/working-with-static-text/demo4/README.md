如何在文本视图中设置文本格式？
===

`SwiftUI` 的文本视图具有一个可选的 `formatter` 参数，可让我们自定义标签内数据的显示方式。 这很重要，因为当程序中发生某些事情时，值通常会为我们更新，因此通过附加格式化程序 `SwiftUI` 可以确保我们的数据代表我们正确。

例如，这定义了一个日期格式器，并使用它来确保任务日期以人类可读的形式显示：

```swift
struct ContentView: View {
    static let taskDateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()

    let dueDate = Date()

    var body: some View {
        Text("Task due date: \(dueDate, formatter: Self.taskDateFormat)")
    }
}
```

它将显示类似 “Task due date: March 16 2021”。