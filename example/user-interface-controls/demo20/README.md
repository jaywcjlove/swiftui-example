如何使用 `ProgressView` 显示任务的进度？
===

SwiftUI 的 `ProgressView` 可以绑定到 `Double` 以显示水平进度条。 例如，这将创建一个标题为 `Downloading` 的进度条，其显示为 `downloadAmount`，以确定进度条应有多满：

```swift
struct ContentView: View {
    @State private var downloadAmount = 0.0

    var body: some View {
        VStack {
            ProgressView("Downloading…", value: downloadAmount, total: 100)
        }
    }
}
```

实际上，您需要某种方式来实际更改该值，例如计时器，网络请求或其他用户界面。 例如，这将在几秒钟内填满进度栏：

```swift
struct ContentView: View {
    @State private var downloadAmount = 0.0
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack {
            ProgressView("Downloading…", value: downloadAmount, total: 100)
        }
        .onReceive(timer) { _ in
            if downloadAmount < 100 {
                downloadAmount += 2
            }
        }
    }
}
```

注意：如果您将进度值设置为高于进度总计，则 `Xcode` 会很生气–确保如上所示限制其上限。