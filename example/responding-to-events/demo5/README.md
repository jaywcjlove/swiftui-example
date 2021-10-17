应用启动时如何运行代码？
===

当您使用 `SwiftUI` 应用生命周期时，您的应用会通过一种符合应用协议的结构启动。 它的工作是使用 `WindowGroup`，`DocumentGroup` 或类似名称创建初始视图，但是由于它是在任何实际视图之前创建的，因此这是在应用启动时运行代码的理想场所。

例如，如果您想设置一些初始 `UserDefaults` 值，则应用程序的初始化程序是校准 `register(defaults:)` 的好地方。此方法设置默认默认值，我的意思是仅在设置用户默认值之前存在 `UserDefaults` 值的初始值-一旦您提供自己的值，这些默认值将不再使用，并且这些初始值也会在出现以下情况时消失 您的应用已终止，因此您应该在每次启动时都将其称为“确定”。

因此，我们可能会这样写：

```swift
@main
struct ExampleApp: App {
    // 每次启动时注册初始 UserDefaults 值
    init() {
        UserDefaults.standard.register(defaults: [
            "name": "Taylor Swift",
            "highScore": 10
        ])
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```

该 `initializer()` 在调用 `body` 属性之前运行，因此也在 `ContentView` 调用之前运行。 因此，您在 `ContentView` 中读取 `UserDefaults` 的任何位置都已经具有您的默认值。

为了说明这一点，下面是一个使用 `@AppStorage` 读取 `name` 键的 `ContentView` 结构示例：

```swift
struct ContentView: View {
    @AppStorage("name") var name = "匿名"

    var body: some View {
        Text("您的名字是 \(name).")
    }
}
```

使用 `@AppStorage` 要求我们为属性提供一个初始值，这很麻烦，因为我们需要确保在使用该属性的所有地方都具有相同的初始值。

但是，这并不重要：“匿名”仅用于不存在任何值且未注册任何初始默认值的时间。 我们已经在应用程序的初始化程序中调用了 `register(defaults:)`，因此该视图将显示 `您的名字是 Taylor Swift`。