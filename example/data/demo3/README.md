如何从 `SwiftUI` 视图访问 `Core Data` 管理的对象上下文？
---

如果您按照[我的 `Core Data` 和 `SwiftUI` 设置说明](../demo2/README.md)进行操作，那么您已经将托管对象上下文注入到 `SwiftUI` 环境中。

如果没有，请确保将以下代码添加到场景委托中：

```swift
ContentView()
    .environment(\.managedObjectContext, yourCoreDataContext)
```

这会将我们的视图上下文作为环境数据直接传递到 `ContentView` 中，这意味着我们可以向 `ContentView` 添加 `@Environment` 属性以立即读取托管对象上下文：

```swift
@Environment(\.managedObjectContext) var managedObjectContext
```

注意：使用 `@FetchRequest` 执行提取请求时，不需要为托管对象上下文添加本地属性-您只需要将其用于保存，删除和其他一些任务。