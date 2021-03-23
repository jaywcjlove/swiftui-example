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