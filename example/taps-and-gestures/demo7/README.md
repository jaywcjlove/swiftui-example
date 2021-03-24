如何检测摇动手势？
---

SwiftUI 没有内置的方法来检测用户在摇晃设备，但是通过覆盖 `UIWindow` 中的 `motionEnded()` 并创建自定义视图修饰符来创建自己的代码并不需要太多工作。

这需要五个步骤：

- 向 `UIDevice` 添加扩展以跟踪将在发生摇动手势时发送的新通知。
- 在 `UIWindow` 上创建扩展，以覆盖默认的 `motionEnded()` 方法。`UIKit` 在此处发送摇动手势，因此您应该查找发生的情况并将其转换为新的通知。
- 创建一个自定义视图修改器以监视要发布的摇动通知，并在发生时调用您选择的函数。
- 创建一个View扩展，将新修饰符整齐地包裹起来。
- 在视图中尝试一下。
重要说明：在编写视图时，除非先添加 `onAppear()`，否则视图修饰符不能与 `onReceive()` 一起使用，这就是它出现在上方的原因。是的，它是空的，但是可以解决此问题。

这是一个完整的代码示例，它通过注释逐步说明了所有五个步骤：

```swift
// 发生摇动手势时我们将发送的通知。
extension UIDevice {
    static let deviceDidShakeNotification = Notification.Name(rawValue: "deviceDidShakeNotification")
}

// 覆盖摇动手势的默认行为，改为发送我们的通知。
extension UIWindow {
     open override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            NotificationCenter.default.post(name: UIDevice.deviceDidShakeNotification, object: nil)
        }
     }
}

// 一个视图修改器，它检测到晃动并调用我们选择的功能。
struct DeviceShakeViewModifier: ViewModifier {
    let action: () -> Void

    func body(content: Content) -> some View {
        content
            .onAppear()
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.deviceDidShakeNotification)) { _ in
                action()
            }
    }
}

// 一个View扩展，使修改器更易于使用。
extension View {
    func onShake(perform action: @escaping () -> Void) -> some View {
        self.modifier(DeviceShakeViewModifier(action: action))
    }
}

// 响应晃动的示例视图
struct ContentView: View {
    var body: some View {
        Text("Shake me!")
            .onShake {
                print("Device shaken!")
            }
    }
}
```

如您所见，完成前四个步骤后，就可以继续向任何所需的视图添加 `onShake()` 修饰符，从而提供一些自定义代码以在发生摇动手势时运行–设置起来并不容易， 但是一旦完成，一切都可以很好地进行。