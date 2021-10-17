如何从 SwiftUI 视图添加 `Core Data` 对象？
===

在 `SwiftUI` 中将核心数据对象保存在 `SwiftUI` 之外的方式与之完全相同：访问托管对象上下文，在该上下文中创建您的类型的实例，然后在准备好后保存该上下文。

如果您按照我的 `Core Data` 和 `SwiftUI` 设置说明进行操作，那么您已经将托管对象上下文注入到 `SwiftUI` 环境中。

在需要创建 `Core Data` 对象的任何地方，都应该向 `ContentView` 添加 `@Environment` 属性，以立即读取托管对象的上下文：

```swift
@Environment(\.managedObjectContext) var managedObjectContext
```

接下来，继续引用您的 `ManagedObjectContext`，在任何需要的地方创建您的 `Core Data` 实体类的实例。 在我的示例设置中，我们有一个带有名称和创建者属性的 `ProgrammingLanguage` 实体，因此我们可以在 `SwiftUI` 按钮操作中创建其中一个实体，如下所示：

```swift
Button("Insert example language") {
    let language = ProgrammingLanguage(context: managedObjectContext)
    language.name = "Python"
    language.creator = "Guido van Rossum"
    // more code here
}
```

最后，在适当的时候保存上下文 - 在添加对象组之后，应用程序状态更改时等等，可能会立即保存上下文。

如果您使用的是之前的 `PersistenceController` 设置代码，请在此替换 //更多代码：

```swift
PersistenceController.shared.saveContext()
```

如果不是这样，请改用以下代码：

```swift
do {
    try managedObjectContext.save()
} catch {
    // 处理 `Core Data` 错误
    // 用代码替换此实现，以适当地处理错误。
    // fatalError() 使应用程序生成崩溃日志并终止。 尽管此功能在开发过程中可能很有用，但您不应在生产应用程序中使用此功能。
    let nsError = error as NSError
    fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
}
```

请记住，对于不是直接在创建新对象之后进行的常规保存，通常值得添加检查以查看托管对象上下文是否有任何更改：

```swift
if managedObjectContext.hasChanges {
```