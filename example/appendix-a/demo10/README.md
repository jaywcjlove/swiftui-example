什么是 `@GestureState` 属性包装器？
===

SwiftUI 为我们提供了一个用于跟踪手势状态的特定属性包装器，称为 `@GestureState`。 尽管您可以使用简单的 `@State` 属性包装器完成相同的操作，但 `@GestureState` 具有附加功能，即当手势结束时，它会自动将属性设置回其初始值，并且通常比使用简单的 `@State` 快得多 。

例如，我们可能想要创建一个可以拖动视图的手势。 为此，我们首先需要创建一个 `@GestureState` 属性，以存储视图已移动了多少，如下所示：

```swift
@GestureState var dragAmount = CGSize.zero
```

该参数的默认值为 `CGSize.zero`，这意味着手势结束时它将自动返回该值。

接下来，我们将附加一个 `offset()` 修饰符，以使我们的视图可以通过 `dragAmount` 中的任何值移动：

```swift
Image("niagara-falls")
    .offset(dragAmount)
```

最后，我们将绑定到我们的 `dragAmount` 属性的手势，如下所示：

```swift
Image("niagara-falls")
    .offset(dragAmount)
    .gesture(
        DragGesture().updating($dragAmount) { value, state, transaction in
            state = value.translation
        }
    )
```

里面有很多代码，所以我们将其解压缩：

- `DragGesture().updating()`代码创建一个新的拖动手势，要求它修改存储在 `dragAmount` 中的值-这就是我们的 `CGSize`。
- 它需要一个带有三个参数的闭包：`value`，`state` 和 `transaction`。
- `value` 参数是拖动的当前数据-拖动的开始位置，移动的距离，预计的结束位置等等。
- `state` 参数是一个inout值，这是我们的属性。因此，除了直接读取或写入 `dragAmount` 之外，我们还应该修改状态。
- `transaction` 参数是一个 `inout` 值，用于存储整个动画上下文，从而为我们提供了一些有关正在发生的情况的信息，例如，这是连续动画还是瞬态动画。连续动画可以通过拖动滑块来产生，而瞬态动画可以通过点击按钮来产生。
- 为了使我们的视图可拖动，我们要做的就是将当前转换直接分配给状态拖动（在这种情况下，它实际上是dragAmount），然后在 `offset()` 修饰符中使用它来移动视图。

请记住，`@GestureState` 的优点之一是，当手势结束时，它会自动将属性的值设置回其初始值。在这种情况下，这意味着我们可以在所需的所有位置上拖动视图，放开后，它将立即回到其原始位置。