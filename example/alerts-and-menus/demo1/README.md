使用简介
===

SwiftUI 的声明式编程方法意味着我们不会像在 `UIKit` 中那样创建和呈现警报和操作表。相反，我们定义了显示它们的条件，告诉它们应该是什么样，然后让它自己解决其余的问题。

所有这些都可以使用修饰符完成，这些修饰符会将新的 `UI` 附加到我们的视图中，当满足条件时将显示该 `UI`。您可以根据需要附加任意数量，它们实际上是在等待观看，直到其条件变为真为止，此时它们将显示其 `UI`。例如，您可以在按钮按下时切换一个布尔值，从而触发显示警报。

您可以将演示文稿附加到主视图或其任何子视图，甚至可以附加到调整状态的按钮，以便触发演示文稿。这是一个微妙的区别，但重要的是要了解这些演示文稿并没有附加到按钮上，因为它是一个按钮-也就是说，由于轻按了按钮，因此不会以任何方式显示警报。相反，我们将其附加到我们的视图层次结构，以便 `SwiftUI` 意识到它可以随时显示。