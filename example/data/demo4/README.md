如何使用 `@FetchRequest` 创建核心数据获取请求？
===

提取请求使我们能够加载符合我们指定的特定条件的 `Core Data` 结果，SwiftUI 可以将这些结果直接绑定到用户界面元素。

如果您按照我的 `Core Data` 和 `SwiftUI` 设置说明进行操作，那么您已经将托管对象上下文注入到 `SwiftUI` 环境中。

该步骤是必需的。我知道，您只想知道如何运行核心数据获取请求并在 `SwiftUI` 列表中显示数据，但是如果您不按照上面链接中的步骤操作，则 `@FetchRequest` 会在运行时崩溃，因为 `SwiftUI` 期望该设置已经完成了。

将托管对象上下文通过 `.managedObjectContext` 键附加到环境后，就可以使用 `@FetchRequest` 属性包装器在视图中创建属性，以自动创建和管理 `Core Data`提取请求。

创建提取请求需要两条信息：要查询的实体和确定返回结果顺序的排序描述符。在我的示例设置中，我们创建了一个具有名称和创建者属性的 `ProgrammingLanguage` 实体，因此我们可以为它创建一个获取请求，如下所示：

```swift
@FetchRequest(entity: ProgrammingLanguage.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \ProgrammingLanguage.name, ascending: true)]) var languages: FetchedResults<ProgrammingLanguage>
```

加载所有编程语言，并按其名称按字母顺序排序。

如您所见，`sortDescriptors` 参数是一个数组，因此您可以根据需要提供尽可能多的排序选项，如下所示：

```swift
@FetchRequest(entity: ProgrammingLanguage.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \ProgrammingLanguage.name, ascending: true), NSSortDescriptor(keyPath: \ProgrammingLanguage.creator, ascending: false)]) var languages: FetchedResults<ProgrammingLanguage>
```

是的，那是一大堆代码，所以如果您将它分解成更易于阅读的内容，我也不会怪您：

```swift
@FetchRequest(
    entity: ProgrammingLanguage.entity(),
    sortDescriptors: [
        NSSortDescriptor(keyPath: \ProgrammingLanguage.name, ascending: true),
        NSSortDescriptor(keyPath: \ProgrammingLanguage.creator, ascending: false)
    ]
) var languages: FetchedResults<ProgrammingLanguage>
```

无论您如何创建获取请求，结果都可以直接在 `SwiftUI` 视图中使用。 例如，我们可以显示所有语言的表格，如下所示：

```swift
List(languages, id: \.self) { language in
    Text(language.name ?? "Unknown")
}
```