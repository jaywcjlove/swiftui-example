如何控制应用启动时显示的视图？
===

当您创建一个新的 SwiftUI 项目时，`Xcode` 会自动创建一个与您的项目同名的新 Swift 文件，该文件将用于引导您的应用程序 – 展示您的初始用户界面。

例如，默认文件如下所示：

```swift
struct SwiftUITestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```

因此，您可以将 `ContentView` 更改为要显示的其他任何视图。

但是，这是设置所需的所有核心UI（例如选项卡视图）的好地方：

```swift
WindowGroup {
    TabView {
        HomeView()
        ContactsView()
        LocationView()
        AccountView()
    }
}
```