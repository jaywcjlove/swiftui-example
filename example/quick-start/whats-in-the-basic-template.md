基本模板是什么？
===

![Updated for Xcode 13](https://img.shields.io/static/v1?label=&message=Updated%20for%20Xcode%2013.1&color=blue&logo=Xcode&logoColor=white)
![New in macOS 12](https://img.shields.io/static/v1?label=&message=New%20in%20macOS%2012&color=lightgrey&logo=apple)

提示：你可能认为这一章完全可以跳过，但除非你是一个 Swift 天才，否则你应该读到最后，以确定这一点。

基本的 App 模板给了你以下内容：

1. YourProjectName.swift。这将执行一个初始设置，然后创建并显示你的初始视图。
2. ContentView.swift。这是我们最初的一块用户界面。如果这是一个 UIKit 项目，这将是 Xcode 给我们的 ViewController 类。
3. Assets.xcassets。这是一个资产目录，它存储了我们项目中使用的所有图片和颜色。
4. Info.plist 是一个属性列表文件，在这个例子中，它用于存储我们的应用程序的系统范围内的设置--例如，在 iOS 主屏幕上的图标下面应该显示什么名字。
5. 一个名为 Preview Content（预览内容）的组，包含另一个名为 Preview Assets （预览资产）的资产目录。

就是这样--它的代码和资源数量少得令人高兴，这意味着我们可以在此基础上进行开发。

我们真正关心的部分--事实上，在这里它是唯一重要的部分--是 `ContentView.swift`。这是我们应用程序的主要功能部分，我们可以在这里开始尝试各种 SwiftUI 代码，只需一会儿。

首先，是什么让 `ContentView.swift` 显示在屏幕上？

好吧，如果你记得我说过，`YourProjectName.swift` 负责管理你的应用程序的显示方式。显然，它实际上不叫这个名字--它将根据你在创建项目时选择的项目名称来命名。

现在继续打开这个文件，你会看到里面有这样的代码：

```swift
@main
struct YourProjectName: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```

这段代码创建了一个新的 `ContentView` 实例（这是我们即将要研究的主要功能），并把它放在一个窗口组中，使它在屏幕上可见。通过显示 `ContentView` 的第一个实例，它有效地引导了我们的应用程序，然后就交给我们了--你想做什么？

打开 `ContentView.swift`，让我们看看一些实际的 SwiftUI 代码。你应该看到这样的代码：

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```

这里的代码量不是很多，但它确实包含了很多东西。

首先，注意 `ContentView` 是一个结构体。熟悉 UIKit 的开发者会知道这一点很重要--我们的用户界面可以从所有的不变性和简单的值类型中获益，不熟悉 UIKit 的人......那就点头微笑吧--你永远不知道我们曾经的痛苦。

第二，`ContentView` 遵守 `View` 协议。你想在 SwiftUI 中显示的所有东西都需要遵守 `View` ，而这实际上只意味着一件事：你需要有一个叫做 `body` 的属性来返回某种类型的 `View`。

第三，`body` 的返回类型是 `some View`。`some` 关键字是在 Swift 5.1 中引入的，是一个叫做不透明返回类型的功能的一部分，在这种情况下，它的意思就是 "这将返回某种视图，但 SwiftUI 不需要知道（或关心）什么"。

**重要**。返回 `some View` 意味着 `body` 属性将返回遵守 `View` 协议的东西。你不能忘记返回任何东西--否则 Swift 编译器会拒绝构建你的代码。

第四，在 `body` 属性里面有 `Text("Hello World")`，它创建了一个文本 "Hello World "的标签。

第五，`Text` 视图下面有一个 `padding()` 方法调用。在 SwiftUI 中，这实际上创建了一个新的视图，周围有填充物，而不是改变现有的 `Text` 视图。因此，我们称这些修饰符（modifiers）而不是方法，是因为它们创建了修改过的内容。

最后，在 `ContentView` 下面有一个类似但又不同的结构，叫做 `ContentView_Previews`。它不遵守 `View` 协议，因为它是专门用来在 Xcode 中显示视图预览的，而不是在真正的应用中显示在屏幕上。这段代码只有在我们的应用程序在调试环境中运行时才被内置到成品中，因为它在生产应用程序中没有意义。

我们很快就会更详细地了解这些组件，但首先让我们来看看 `Text` 组件...