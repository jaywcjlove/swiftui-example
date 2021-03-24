如何使用 `appStoreOverlay()` 推荐另一个应用程序？
---

SwiftUI 为我们提供了一个专用的修饰符，可以在 `App Store` 上推荐其他应用，这是与用户交叉销售的好方法 - “如果您喜欢它，您也会喜欢它”，依此类推。 如果您使用的是应用剪辑，这将特别有用，一旦用户执行了主要操作，您就可以在剪辑中推荐完整的应用。

此修改器需要观察一些状态，这些状态将确定 `App Store` 叠加层是否处于活动状态，以及 `SKOverlay.AppConfiguration` 来确定推荐哪个应用程序。

重要： `appStoreOverlay()`在 `macOS`上不可用，需要添加 `import StoreKit`。

例如，当按下按钮时，这将推荐一个特定的应用程序：

```swift
import StoreKit

struct ContentView: View {
    @State private var showRecommended = false

    var body: some View {
        Button("Show Recommended App") {
            showRecommended.toggle()
        }
        .appStoreOverlay(isPresented: $showRecommended) {
            SKOverlay.AppConfiguration(appIdentifier: "1440611372", position: .bottom)
        }
    }
}
```