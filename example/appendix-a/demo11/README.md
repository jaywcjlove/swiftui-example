什么是 `@FetchRequest` 属性包装器？
---

SwiftUI 为我们提供了专用的属性包装器，用于处理 `Core Data` 提取请求，它使我们可以直接将数据嵌入到 `SwiftUI` 视图中，而无需编写额外的逻辑。

您必须为 `@FetchRequest` 提供至少两个值：要读取的实体，以及用于排列数据的任何排序描述符。 您还可以选择提供谓词以根据需要过滤数据。

重要提示：在使用 `@FetchRequest` 之前，您必须首先将 `Core Data` 托管对象上下文注入到环境中–有关如何执行此操作的说明，请参见如何从 `SwiftUI` 视图访问 `Core Data` 托管对象上下文。

作为一个基本示例，我们可以显示来自 `Core Data` 上下文的所有用户，如下所示：

```swift
@FetchRequest(
    entity: User.entity(),
    sortDescriptors: []
) var users: FetchedResults<User>
```

这不会对数据进行排序，因此将按照添加顺序返回用户。`@FetchRequest` 自动包含 `@ObservedObject`，因此，如果您在`List`，`ForEach`或类似文件中使用数据，则当基础数据发生更改时，它将自动刷新。

提示：我将 `@FetchRequest` 代码分成几行，以使其更易于阅读，但这不是必需的。

如果要对数据进行排序，请以键路径数组的形式提供排序描述符，如下所示：

```swift
@FetchRequest(
    entity: User.entity(), 
    sortDescriptors: [
        NSSortDescriptor(keyPath: \User.name, ascending: false)
    ]
) var users: FetchedResults<User>
```

您可以根据需要提供任意数量的内容，它们将按顺序进行评估。

要同时添加 `predicate`，请使用以下格式创建 `NSPredicate`：

```swift
@FetchRequest(
    entity: User.entity(),
    sortDescriptors: [
        NSSortDescriptor(keyPath: \User.name, ascending: false),
    ],
    predicate: NSPredicate(format: "surname == %@", "Hudson")
) var users: FetchedResults<User>
```
