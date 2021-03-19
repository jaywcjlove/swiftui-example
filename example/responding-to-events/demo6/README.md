如何将 `AppDelegate` 添加到 SwiftUI 应用？
---

SwiftUI 应用程序使用符合 `App` 协议的自定义结构启动，但有时您可能想找回我们曾经拥有的旧 `UIApplicationDelegate` 功能 - 也许处理推送通知的注册，响应内存警告，检测时间变化， 等等。

为此，首先创建一个自定义类，该类继承自 `NSObject` 并符合 `UIApplicationDelegate` 协议，如下所示：

```swift
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("Your code here")
        return true
    }
}
```

我在其中添加了 `didFinishLaunchingWithOptions`，但是您只需要实现您关心的方法即可。

现在，在您的 `App` 场景中，使用 `UIApplicationDelegateAdaptor` 属性包装器告诉 `SwiftUI` 它应为应用程序委托使用 `AppDelegate` 类。

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

SwiftUI 负责创建该委托并照顾其生命周期，因此您可以继续向该类添加任何其他应用程序委托功能以进行调用。

提示：对于推送通知，您可能应该调整 `UNUserNotificationCenter.current()` 的委托属性，以使其指向您拥有的自定义类。