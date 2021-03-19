如何将 `Section` 添加到列表？
---

SwiftUI 的列表视图内置了对节和节标题的支持，就像 `UIKit` 中的 `UITableView` 一样。 要在某些单元格周围添加一个节，请先在其周围放置一个 `Section`，然后还可以选择添加页眉和页脚。

例如，我们可以创建一行来保存提醒应用程序的任务数据，然后创建一个包含两个部分的列表视图：一个用于重要任务，另一个用于次要任务。

外观如下：

```swift
struct TaskRow: View {
    var body: some View {
        Text("Task data goes here")
    }
}

struct ContentView: View {
    var body: some View {
        List {
            Section(header: Text("Important tasks")) {
                TaskRow()
                TaskRow()
                TaskRow()
            }

            Section(header: Text("Other tasks")) {
                TaskRow()
                TaskRow()
                TaskRow()
            }
        }
    }
}
```

您还可以将页脚文本添加到各部分，如下所示：

```swift
List {
    Section(header: Text("Other tasks"), footer: Text("End")) {
        Text("Row 1")
        Text("Row 2")
        Text("Row 3")
    }
}
```