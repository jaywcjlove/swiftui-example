什么是 `@UIApplicationDelegateAdaptor` 属性包装器？
---

如果需要访问 `SwiftUI` 中的 `AppDelegate` 功能，则应创建一个继承自 `NSObject` 和 `UIApplicationDelegate` 的类，并为其提供所需的任何功能，例如：

```swift
class AppDelegate: NSObject, UIApplicationDelegate {
    // add app delegate methods here
}
```

例如，如果您想实现旧的 `didFinishLaunchingWithOptions` 方法，则可以使用以下方法：

```swift
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("Your code here")
        return true
    }
}
```

一旦有了，在主应用程序中使用 `UIApplicationDelegateAdaptor` 属性包装器，以便 `SwiftUI` 知道创建和管理您的应用程序委托类：

```swift
@main
struct NewIn14App: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```