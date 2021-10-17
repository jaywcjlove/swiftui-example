如何限制获取请求中的项目数？
===

`SwiftUI` 的 `@FetchRequest` 属性包装器非常适合对对象进行简单的请求，同时提供排序和过滤功能。 但是，如果您要调整退回的商品数量-也许要说“向我显示结果中的前10个商品”，那么您需要自己做更多的工作。

首先，创建没有初始值的 `@FetchRequest` 属性。 例如，如果我们想使用 `ProgrammingLanguage` 实体，则可以使用以下方法：

```swift
@FetchRequest var languages: FetchedResults<ProgrammingLanguage>
```

现在，为您的视图创建一个自定义初始化程序，该初始化程序使用 `NSFetchRequest` 来构建所需的确切请求。 准备就绪后，您可以将其放入常规的 `FetchRequest` 中，并将其直接分配给您的媒体资源。

例如，如果我们想在不进行任何排序或过滤的情况下阅读前 `10` 种编程语言，则可以使用以下代码：

```swift
init() {
    let request: NSFetchRequest<ProgrammingLanguage> = ProgrammingLanguage.fetchRequest()
    request.fetchLimit = 10

    _languages = FetchRequest(fetchRequest: request)
}
```

或者，如果我们想要过滤，排序和行限制，我们也可以这样做：

```swift
init() {
    let request: NSFetchRequest<ProgrammingLanguage> = ProgrammingLanguage.fetchRequest()
    request.predicate = NSPredicate(format: "active = true")

    request.sortDescriptors = [
        NSSortDescriptor(keyPath: \ProgrammingLanguage.name, ascending: true)
    ]

    request.fetchLimit = 10
    _languages = FetchRequest(fetchRequest: request)
}
```