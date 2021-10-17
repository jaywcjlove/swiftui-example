如何使用 `predicate` 过滤核心数据获取请求？
===

就像通过 `UIKit` 一样，核心数据获取请求可以在 `SwiftUI` 中使用谓词，所有这些都可以通过为 `@FetchRequest` 属性包装器提供 `predicate` 属性来实现。

如果您按照我的 `Core Data` 和 `SwiftUI` 设置说明进行操作，那么您已经将托管对象上下文注入到 `SwiftUI` 环境中。

完成后，您可以为一个实体创建获取请求，并传入一个或多个排序描述符和谓词。 这些谓词与没有 `SwiftUI` 时将使用的 `NSPredicate` 实例相同，这意味着您可以使用通常使用的各种字符串操作。

例如，使用我的设置说明中的示例数据，我们可以创建这样的谓词：

```swift
NSPredicate(format: "name == %@", "Python")
```

这将显示有关Python的详细信息，而忽略其他数据。

我们可以在获取请求中使用它，如下所示：

```swift
@FetchRequest(
    entity: ProgrammingLanguage.entity(),
    sortDescriptors: [
        NSSortDescriptor(keyPath: \ProgrammingLanguage.name, ascending: true),
    ],
    predicate: NSPredicate(format: "name == %@", "Python")
) var languages: FetchedResults<ProgrammingLanguage>
```

由于 `@FetchRequest` 使用标准的核心数据谓词，因此您也可以创建复合 `predicate`。

