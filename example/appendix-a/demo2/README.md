所有 SwiftUI 属性包装器都进行了解释和比较
---

SwiftUI 为我们的应用程序提供了 `17` 个属性包装器，每个属性包装器都提供不同的功能。知道使用哪个以及何时使用对正确处理至关重要，因此在本文中，我将向您介绍其中的每一个，并为您提供明确的使用指南。

## TL;DR

我将在稍后解释更多，但这是 `too long; didn’t read` 摘要，大致描述了每个包装程序的工作，是否拥有数据（即数据是否属于它并由它管理）以及指向更多内容的链接：

- `@AppStorage` 从 `UserDefaults` 读取和写入值。这拥有其数据。[更多信息](../demo12/README.md)。
- `@Binding` 引用另一个视图拥有的值类型数据。在本地更改绑定也会更改远程数据。这不拥有其数据。[更多信息](../demo9/README.md)。
- `@Environment` 允许我们从系统读取数据，例如配色方案，可访问性选项和特征集，但是如果需要，您可以在此处添加自己的密钥。这不拥有其数据。[更多信息](../demo8/README.md)。
- `@EnvironmentObject` 读取我们放入环境中的共享对象。这不拥有其数据。[更多信息](../demo7/README.md)。
- `@FetchRequest` 为特定实体启动核心数据获取请求。这拥有其数据。[更多信息](../demo11/README.md)。
- `@FocusedBinding` 旨在监视键窗口中的值，例如当前选定的文本字段。这不拥有其数据。
- `@FocusedValue` 是 `@FocusedBinding` 的简单版本，不会为您解开绑定值。这不拥有其数据。
- `@GestureState` 存储与当前正在进行的手势关联的值，例如您滑动了多远，除非在手势停止时它将重置为其默认值。这拥有其数据。[更多信息](../demo10/README.md)。
- `@Namespace` 创建一个动画名称空间，以允许匹配的几何效果，该效果可以由其他视图共享。这拥有其数据。
- `@NSApplicationDelegateAdaptor` 用于创建类并将其注册为 `macOS` 应用程序的应用程序委托。这拥有其数据。
- `@ObservedObject` 引用符合 `ObservableObject` 协议的外部类的实例。这不拥有其数据。[更多信息](../demo6/README.md)。
- `@Published` 附加到 `ObservableObject` 内的属性，并告诉 SwiftUI 它应该在更改此属性时刷新使用此属性的所有视图。这拥有其数据。更多信息。
- `@ScaledMetric` 会读取用户的动态类型设置，并根据您提供的原始值向上或向下缩放数字。这拥有其数据。更多信息。
- `@SceneStorage` 使我们可以保存和还原少量数据以进行状态还原。这拥有其数据。更多信息。
- `@State` 允许我们在视图本地操作少量的值类型数据。这拥有其数据。更多信息。
- `@StateObject` 用于存储符合 `ObservableObject` 协议的引用类型数据的新实例。这拥有其数据。更多信息。
- `@UIApplicationDelegateAdaptor` 用于创建一个类并将其注册为iOS应用程序的应用程序委托。这拥有其数据。更多信息。

## 存储临时数据

在将数据存储到应用程序中时，最简单的属性包装器是`@State`。它旨在存储视图本地使用的值类型，因此非常适合存储整数，布尔值，甚至存储结构的本地实例。

相比之下，`@Binding`用于要更改的简单数据，但不属于您的视图。例如，考虑一下内置的 `Toggle` 开关是如何工作的：它需要在打开和关闭状态之间移动，但是它不想自己存储该值，因此它绑定了我们拥有的某个外部值。因此，我们的视图具有`@State`属性，而 `Toggle` 具有`@Binding`属性。

`@State`有一个称为`@GestureState`的变体，专门用于跟踪活动手势。这种用法很少使用，但是它的好处是，手势结束后，您可以将其属性设置回其初始值。

为了更高级的目的（即处理类或在许多地方共享数据），您不应使用`@State`和`@Binding`。相反，您应该使用`@StateObject` 在某个位置创建对象，然后将其与`@ObservedObject`在其他视图中使用。

一个简单的规则是：如果在属性包装器的名称中看到 `state`，则意味着视图绝对拥有数据。

因此，`@State`表示在本地创建和管理的简单值类型数据，但可能使用`@Binding`在其他地方共享，`@StateObject`表示在本地创建和管理的引用类型数据，但可能在其他地方使用`@ObservedObject`之类共享。

这很重要：如果您看到`@ObservedObject var something = SomeType()` ，那么几乎应该肯定是`@StateObject`，以便 `SwiftUI` 知道视图应该拥有数据，而不仅仅是在其他地方引用它。在这里使用 `@ObservedObject` 有时会导致您的应用程序崩溃，因为该对象被过早破坏了。

如果您发现自己从一个视图到另一个视图处理相同的数据，则会发现 `@EnvironmentObject` 属性包装器很有用。这使您可以从共享环境中读取引用类型对象，而不是显式传递它。

就像 `@ObservableObject` 一样，`@EnvironmentObject` 最初不应该用于创建对象。而是在另一个视图中创建它，并使用 `environmentObject()` 修饰符将其注入到环境中。尽管环境会自动保留对象的所有权，但是您也可以使用 `@StateObject` 将其存储在最初创建的位置。但是，这不是必需的：将对象放入环境中足以使它保持活动状态，而无需进一步的所有权。

最终的基于状态的属性包装器是 `@Published`，它在引用类型内部用于注释属性。标记为 `@Published` 的任何属性都将导致其父类宣布发生了更改，这又将导致任何观察该对象的视图进行所需的任何更改。

## 存储长期数据

SwiftUI具有三个用于存储和/或检索数据的属性包装器。

第一个是 `@AppStorage`，它是 `UserDefaults` 的包装。每次您从应用存储中读取或写入值时，实际上就是在从 `UserDefaults` 中读取或写入值。

第二个是 `@SceneStorage`，它是 `Apple` 状态恢复API的包装。状态恢复允许关闭和重新加载应用程序，并使其恢复到用户停止使用的相同状态-使得我们的应用程序始终处于运行状态，即使它们已被静默终止。

`@AppStorage` 和 `@SceneStorage`不安全，不应用于存储敏感数据。

尽管`@AppStorage`和 `@SceneStorage` 听起来一样，但它们却不一样：`@AppStorage`为整个应用程序存储一个值，而` `会在用户多次打开您的应用程序窗口时自动为同一数据保存多个值 – 考虑一下 `iPadOS` 和 `macOS` 。

因此，您可以使用`@AppStorage`存储全局值，例如“用户的最高分数是多少？”，并且可以使用 `@SceneStorage` 存储“用户现在正在阅读的页面是什么？”

第三个数据属性包装器是 `@FetchRequest`，用于从 `Core Data` 检索信息。这将自动使用环境中的任何托管对象上下文，并在基础数据发生更改时自动更新。


## 读取环境数据

SwiftUI 具有两个用于读取用户环境的属性包装器：`@Environment` 和 `@ScaledMetric`。

`@Environment`用于读取各种数据，例如当前正在启用哪些特征收集，是否使用2x或3x屏幕，处于什么时区等等。 它还具有一些特殊的应用程序操作，例如导出文件和在系统注册的 Web浏览器中打开 URL。

`@ScaledMetric` 更为简单，它使我们能够根据用户的动态类型设置来调整用户界面的大小。 例如，使用系统默认大小，100x100点的盒子可能看起来不错，但是使用 `@ScaledMetric` 时，启用较大的 `Dynamic Type` 设置时，它会自动变为200x200。

## 引用视图

SwiftUI 提供了 `@Namespace` 属性包装器，该包装器为动画创建了一个新的命名空间。动画名称空间让我们说“动画ID为5的视图”，并且该名称空间中ID为5的所有视图都将被动画化。

您可以使用属性类型 `Namespace.ID` 并从创建视图的任何视图中注入 `@Namespace` 值，从而在视图之间共享名称空间。 这使您可以跨视图创建匹配的几何效果动画，而不是将所有数据存储在当前视图中。

## 申请处理

如果您需要访问旧的 `UIApplicationDelegate` 和 `NSApplicationDelegate`方法和通知，则应分别使用`@UIApplicationDelegateAdaptor` 和 `@NSApplicationDelegateAdaptor`属性包装器。

您为它们提供应用程序委托的类，它们将确保创建实例并发送所有适当的通知。

## 真理之源

早些时候，我描述了哪些属性包装器拥有它们的数据，而实际上这涉及到您的应用程序中的真理来源：拥有它们的数据的包装器是真理的源头，因为它们创建和管理值，而没有拥有数据的包装器不是源头。 的确如此，因为他们从其他地方获得了价值。

财产包装是真理的源头

这些直接创建和管理值：

- `@AppStorage`
- `@FetchRequest`
- `@GestureState`
- `@Namespace`
- `@NSApplicationDelegateAdaptor`
- `@Published`
- `@ScaledMetric`
- `@SceneStorage`
- `@State`
- `@StateObject`
- `@UIApplicationDelegateAdaptor`

不是事实来源的属性包装器

这些是从其他地方获取价值的：

- `@Binding`
- `@Environment`
- `@EnvironmentObject`
- `@FocusedBinding`
- `@FocusedValue`
- `@ObservedObject`

如果您什么都不记得了...

我想创建一个由当前视图拥有的新属性。 您应该将 `@State` 用作值类型，并将 `@StateObject` 用作引用类型。

我想引用在其他地方创建的值。 您应该将 `@Binding` 用于值类型，并将 `@ObservedObject`或 `@EnvironmentObject` 用于引用类型。