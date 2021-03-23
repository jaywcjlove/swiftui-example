什么是 `@AppStorage` 属性包装器？
---

SwiftUI 具有专用的属性包装程序，可用于从 `UserDefaults` 中读取值，当值更改时，该程序将自动重新调用视图的 `body` 属性。 也就是说，此包装器有效地监视 `UserDefaults` 中的键，并且如果该键更改，将刷新您的UI。

例如，这将监视 `UserDefaults` 中的 `username` 键，该键将在按下按钮时设置：

```swift
struct ContentView: View {
    @AppStorage("username") var username: String = "Anonymous"

    var body: some View {
        VStack {
            Text("Welcome, \(username)!")

            Button("Log in") {
                username = "@twostraws"
            }
        }
    }
}
```

在上面更改 `username` 将导致新字符串立即写入 `UserDefaults`，同时还会更新视图。 如果我们使用了较旧的方法，那也将是正确的：

```swift
UserDefaults.standard.set("@twostraws", forKey: "username")
```

`@AppStorage` 默认情况下将监视 `UserDefaults.standard`，但是如果您愿意，也可以使其监视特定的应用程序组，如下所示：

```swift
@AppStorage("username", store: UserDefaults(suiteName: "group.com.hackingwithswift.unwrap")) var username: String = "Anonymous"
```

重要：`@AppStorage` 将您的数据写入 `UserDefaults`，这不是安全存储。 因此，您不应使用 `@AppStorage` 保存任何个人数据，因为它相对容易提取。