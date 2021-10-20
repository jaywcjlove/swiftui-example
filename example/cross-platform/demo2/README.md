如何在 `macOS` 上获取半透明列表？
===

![Updated for Xcode 13](https://img.shields.io/static/v1?label=&message=Updated%20for%20Xcode%2013.0&color=success&logo=Xcode&logoColor=white)
![New in macOS 11.6](https://img.shields.io/static/v1?label=&message=New%20in%20macOS%2011.6&color=lightgrey&logo=apple)

macOS 的一个微妙但重要的功能是，当一个窗口处于活动状态时，侧边栏会自动变得稍微透明，然后在窗口移至背景时变为不透明，这是向用户的一个小提示，但该窗口还是有一点 展示他们的背景，让他们对周围环境有一点了解。

SwiftUI 允许我们使用 `List` 上的 `listStyle()` 修饰符创建这些半透明边栏，并传入 `SidebarListStyle()`，如下所示：

```swift
List(1..<51) {
    Text("\($0)")
}
.listStyle(.sidebar)
```

🚧 重要提示：如果您使用 `Xcode 12`，则需要使用 `SidebarListStyle()` 而不是 `.sidebar`。

没有什么可以阻止您将其与任何列表一起使用，但是线索就在名字中：它是专门为显示在主窗口侧面的列表而设计的，正如您在 `Xcode` 的导航器中所看到的那样。

🚧 注意：在 `iOS` 和 `iPadOS` 上，`.sidebar` 不提供半透明背景，但会影响单元格样式。