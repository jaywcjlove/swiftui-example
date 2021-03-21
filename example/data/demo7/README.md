如何从 `SwiftUI` 视图中删除 `Core Data` 对象？
---

在 SwiftUI 中删除 `Core Data` 对象与在 `UIKit` 中删除它们基本相同，尽管要跳过几个特殊的步骤才能与 `SwiftUI` 的视图集成。

如果您按照我的 [`Core Data` 和 `SwiftUI` 设置说明](../demo2/README.md)进行操作，那么您已经将托管对象上下文注入到 `SwiftUI` 环境中。

一旦有了托管对象上下文，就可以将其作为如下属性提供给您的 `SwiftUI` 视图：

```swift
@Environment(\.managedObjectContext) var managedObjectContext
```

接下来，创建一个提取请求，该请求从您的托管对象上下文中读取一些数据。 在我的示例设置中，有一个 `ProgrammingLanguage` 实体，因此我们可以读出以下所有项目：

```swift
@FetchRequest(
    entity: ProgrammingLanguage.entity(),
    sortDescriptors: [
        NSSortDescriptor(keyPath: \ProgrammingLanguage.name, ascending: true),
    ]
) var languages: FetchedResults<ProgrammingLanguage>
```

第三，无论显示数据的位置在您的 `SwiftUI` 视图中添加 `onDelete` 修饰符。 例如，使用上述获取请求，您可以使用 `ForEach` 创建一个列表，如下所示：

```swift
List {
    ForEach(items.indices, id: \.self) { index in
        HStack {
            Text("\(index) Creator: \(items[index].creator ?? "Anonymous")")
            Button("Del Item", action: {
                removeLanguages(at: [index])
            })
        }
    }
    .onDelete(perform: removeLanguages)
}
.toolbar {
    #if os(iOS)
    EditButton()
    #endif

    Button(action: addItem) {
        Label("Add Item", systemImage: "plus")
    }
}
```

最后，将 `removeLanguages()` 方法添加到您的 `SwiftUI` 视图。 这应该接受一个 `IndexSet`，它是应该删除的唯一整数索引的集合：

```swift
func removeLanguages(at offsets: IndexSet) {
    for index in offsets {
        let language = languages[index]
        managedObjectContext.delete(language)
    }
}
```

您可能需要在此时保存您的 `Core Data` 上下文，在这种情况下，在 `for` 循环完成之后添加以下内容：

```swift
do {
    try managedObjectContext.save()
} catch {
    // handle the Core Data error
}
```

或者，如果您使用的是 `PersistenceController` 设置代码，请使用以下代码：

```swift
PersistenceController.shared.saveContext()
```

只需添加 `onDelete()` 修饰符就足以在表行上进行滑动删除，但是如果您还希望使用 `Edit/Done` 按钮来切换编辑模式，则应将此修饰符添加到 `NavigationView` 内部的任何内容上：

```swift
.toolbar {
    EditButton()
}
```