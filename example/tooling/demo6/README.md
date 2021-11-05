如何在 `SwiftUI` 中使用 `Touch ID` 和 `Face ID`?
===

![Updated for Xcode 13](https://img.shields.io/static/v1?label=&message=Updated%20for%20Xcode%2013.1&color=blue&logo=Xcode&logoColor=white)
![New in macOS 12](https://img.shields.io/static/v1?label=&message=New%20in%20macOS%2012&color=lightgrey&logo=apple)

苹果公司的绝大多数设备都标配有生物识别认证，这意味着它们使用指纹和面部识别来解锁。我们也可以使用此功能，这意味着我们可以确保仅当有效用户解锁后才能读取敏感数据。

![](imgs/1.png)

在编写任何代码之前，您需要向 `Info.plist` 文件中添加一个新密钥，向用户说明为什么要访问 `Face ID`。由于只有 `Apple` 知道的原因，我们在代码中传递了 `Touch ID` 请求原因，而在 `Info.plist` 中传递了 `Face ID` 请求原因。

立即打开 `Info.plist`，右键单击一些空间，然后选择 `Add Row`。滚动键列表，直到找到 `Privacy - Face ID Usage Description`，并为其赋予值 `$(PRODUCT_NAME) need Touch Id or Face ID permission for app lock`。

```xml
<key>NSFaceIDUsageDescription</key>
<string>$(PRODUCT_NAME) need Touch Id or Face ID permission for app lock</string>
```

现在回到 `ContentView.swift`，并在文件顶部附近添加以下导入：

```swift
import LocalAuthentication
```

好的，我们都准备好使用生物识别技术了。我之前提到过这“只是有点令人不快”，这就是它的来源：`Swift` 开发人员使用 `Error` 协议来表示运行时发生的错误，但 `Objective-C` 使用一个名为 `NSError` 的特殊类。因为这是一个 `Objective-C API`，我们需要使用 `NSError` 来处理问题，并像常规的 `inout` 参数一样使用 `&` 传递它。

我们将编写一个 `authenticate()` 方法，将所有生物识别功能隔离在一个地方。要做到这一点，需要四个步骤：

1. 创建 `LAContext` 的实例，它允许我们查询生物特征状态并执行身份验证检查。
2. 询问上下文是否能够执行生物识别认证——这很重要，因为 `iPod touch` 既没有 `Touch ID` 也没有 `Face ID`。
3. 如果生物识别是可能的，那么我们开始实际的身份验证请求，传入一个闭包以在身份验证完成时运行。
4. 当用户通过身份验证与否时，我们的完成闭包将被调用并告诉我们它是否有效，如果不是，错误是什么。这个闭包会从主线程调用，所以我们需要将任何与 UI 相关的工作推回到主线程。

请继续将此方法添加到 `ContentView`：

```swift
func authenticate() {
    let context = LAContext()
    var error: NSError?
    // 检查是否可以进行生物特征认证
    if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
        // 有可能，所以继续使用它
        let reason = "We need to unlock your data."
        context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
            // 身份验证现已完成
            DispatchQueue.main.async {
                if success {
                    // authenticated successfully
                    self.isUnlocked = true
                    print("成功认证")
                } else {
                    // there was a problem
                    self.isUnlocked = false
                    print("有个问题")
                }
            }
        }
    } else {
        print("没有生物识别")
        // 没有生物识别
    }
}
```

该方法本身不会做任何事情，因为它根本没有连接到 `SwiftUI`。 为了解决这个问题，我们需要添加一些状态，我们可以在身份验证成功时进行调整，以及一个 `onAppear()` 修饰符来触发身份验证。

因此，首先将此属性添加到 `ContentView`：

```swift
@State private var isUnlocked = false
```

这个简单的布尔值将存储应用程序是否显示其受保护的数据，因此我们将在身份验证成功时将其翻转为 true。 将 `// authenticated successfully` 的注释替换为： 

```swift
self.isUnlocked = true
```

最后，我们可以显示当前的身份验证状态并在 body 属性中开始身份验证过程，如下所示：

```swift
VStack {
    if self.isUnlocked {
        Text("Unlocked")
    } else {
        Text("Locked")
    }
}
.onAppear(perform: authenticate)
```

如果您运行该应用程序，很有可能您只会看到 `Locked` 而没有其他内容。 这是因为模拟器默认情况下没有选择生物识别，而且我们没有提供任何错误消息，所以它默默地失败了。

要使用 `Face ID` 进行试用，请转到 `Hardware` 菜单并选择 `Face ID`> `Enrolled(已注册)`，然后再次启动该应用程序。 这次您应该会看到 `Face ID` 提示出现，您可以通过返回硬件菜单并选择 `Face ID` > `Matching Face` 或 `Non-matching Face` 来触发成功或失败的身份验证。

一切顺利，您应该会看到 `Face ID` 提示消失，其下方将是 `Unlocked` 文本视图——我们的应用程序已检测到身份验证，现在可以使用了。

完整代码如下：

```swift
import SwiftUI
import LocalAuthentication

struct ContentView: View {
    @State private var isUnlocked = false

    var body: some View {
        VStack {
            if self.isUnlocked {
                Text("Unlocked")
            } else {
                Text("Locked")
            }
        }
        .onAppear(perform: authenticate)
    }
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        // 检查是否可以进行生物特征认证
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            // 有可能，所以继续使用它
            let reason = "We need to unlock your data."
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                // 身份验证现已完成
                DispatchQueue.main.async {
                    if success {
                        self.isUnlocked = true
                        print("成功认证")
                    } else {
                        self.isUnlocked = false
                        print("有个问题")
                    }
                }
            }
        } else {
            print("没有生物识别")
            // 没有生物识别
        }
    }
}
```