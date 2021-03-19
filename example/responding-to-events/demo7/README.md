如何检测设备旋转？
---

SwiftUI 没有内置的方法来检测用户在纵向和横向之间旋转设备，但是我们可以使用自定义修饰符来响应 `UIDevice.orientationDidChangeNotification` 通知。

这需要三个步骤：

1. 创建一个自定义视图修改器，以监视方向变化并在发生变化时运行回调函数。 这不是必需的，但是我们将使回调接受 `UIDeviceOrientation` 作为其唯一参数，以防万一您需要了解当前方向。
2. 将视图修改器包装到 `View` 扩展程序中，以便更轻松地调用。
3. 根据您的选择使用自定义修饰符。

```swift
// 我们的自定义视图修饰符可跟踪旋转并调用我们的操作
struct DeviceRotationViewModifier: ViewModifier {
    let action: (UIDeviceOrientation) -> Void

    func body(content: Content) -> some View {
        content
            .onAppear()
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
                action(UIDevice.current.orientation)
            }
    }
}

// 一个视图包装器，使修改器更易于使用
extension View {
    func onRotate(perform action: @escaping (UIDeviceOrientation) -> Void) -> some View {
        self.modifier(DeviceRotationViewModifier(action: action))
    }
}

// 示例视图以演示解决方案
struct ContentView: View {
    @State private var orientation = UIDeviceOrientation.unknown

    var body: some View {
        Group {
            if orientation.isPortrait {
                Text("Portrait")
            } else if orientation.isLandscape {
                Text("Landscape")
            } else if orientation.isFlat {
                Text("Flat")
            } else {
                Text("Unknown")
            }
        }
        .onRotate { newOrientation in
            orientation = newOrientation
        }
    }
}
```

请记住，设备方向并不是您所期望的那样有用。 是的，在 `iPhone` 上横向放置意味着您的水平空间比垂直方向要大，但是在 `iPad` 上，您的应用程序可以在分屏模式下横向运行-从技术上讲，整个屏幕的宽度仍然大于高度，但是 分配给我们应用程序的实际空间只是该宽度的一小部分。