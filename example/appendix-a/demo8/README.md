什么是 `@Environment` 属性包装器？
===

SwiftUI 给我们提供了 `@Environment` 和 `@EnvironmentObject` 属性包装器，但是它们有些微的不同：`@EnvironmentObject` 允许我们向环境中注入任意值，而 `@Environment` 专门用于处理 SwiftUI 自己的预定义键。

例如，`@Environment` 非常适合读取诸如 `Core Data` 受管对象上下文之类的信息，设备是处于暗模式还是亮模式，使用何种尺寸类渲染视图以及更多–来自系统的固定属性 。 在代码中，它看起来像这样：

```swift
@Environment(\.horizontalSizeClass) var horizontalSizeClass
@Environment(\.managedObjectContext) var managedObjectContext
```

另一方面，`@EnvironmentObject` 设计用于从环境中读取任意对象，如下所示：

```swift
@EnvironmentObject var order: Order
```

这种差异听起来很小，但由于实现 `@EnvironmentObject` 的方式而非常重要。 当我们说订单是 `Order`类型时，`SwiftUI` 将在其环境中查找该类型的对象并将其附加到`order` 属性。 但是，使用 `@Environment` 时，无法实现相同的行为，因为许多事物可能共享相同的数据类型。

例如：

```swift
@Environment(\.accessibilityReduceMotion) var reduceMotion
@Environment(\.accessibilityReduceTransparency) var reduceTransparency
@Environment(\.accessibilityEnabled) var accessibilityEnabled
```

所有这三个环境键都返回一个布尔值，因此，如果不指定确切的键，则意味着无法正确读取它们。