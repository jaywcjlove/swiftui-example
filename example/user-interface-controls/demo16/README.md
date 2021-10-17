如何创建步进器 `Stepper` 并从中读取值？
===

SwiftUI 的 `Stepper` 控件使用户可以从我们指定的范围中选择值，并提供与 `UIKit` 中的 `UIStepper` 相同的功能。

例如，这将创建一个绑定到 `age` 属性的步进器，使用户可以选择0到130之间（包括0和130）的值：

```swift
struct ContentView: View {
    @State private var age = 18

    var body: some View {
        VStack {
            Stepper("Enter your age", value: $age, in: 0...130)
            Text("Your age is \(age)")
        }
    }
}
```

除了直接绑定到值之外，还可以提供自定义 `onIncrement` 和 `onDecrement` 闭包来执行自定义工作，如下所示：

```swift
struct ContentView: View {
    @State private var age = 18

    var body: some View {
        VStack {
            Stepper("Enter your age", onIncrement: {
                age += 1
            }, onDecrement: {
                age -= 1
            })

            Text("Your age is \(age)")
        }
    }
}
```