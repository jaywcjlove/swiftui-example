SwiftUI vs Interface Builder 和 storyboards
===

![Updated for Xcode 13](https://img.shields.io/static/v1?label=&message=Updated%20for%20Xcode%2013.1&color=blue&logo=Xcode&logoColor=white)
![New in macOS 12](https://img.shields.io/static/v1?label=&message=New%20in%20macOS%2012&color=lightgrey&logo=apple)

有经验的 `iOS` 开发者都熟悉 `Interface Builder` 和 `storyboards`，甚至可能还有 `XIBs`。他们可能不喜欢这些东西，但他们至少熟悉。如果你以前没有使用过这些，你应该跳过这一段。

还在这里？这意味着你以前用过 `IB`，可能很好奇 `SwiftUI` 有什么不同。好吧，让我问你：你有没有手动编辑过 `storyboards` 或 `XIB` 源文件？

可能没有。好吧，除了那一次，但大致的答案是没有 — `storyboards` 和 `XIB` 包含相当多的 `XML` 语句，不容易阅读，也不容易编辑。

更糟的是，`storyboards` 有一个特性，就是随着时间的推移越来越大。当然，它们开始时可能很小，但后来你又增加了一个视图控制器，又增加了一个，又增加了一个，突然你意识到你在一个文件里有 10 个页面的数据，你所做的任何源控制的改变突然变得相当痛苦。

但是，虽然存在单点故障不是很好，而且当有人提交有关 `storyboards` 的修改并尝试 `pull request` 请求时，基本上不可能看到有什么变化，但 `storyboards` 和 XIBs 有一个更大的问题。

你看，`Interface Builder` 对我们的 `Swift` 代码不了解，而 `Swift` 代码对 `Interface Builder` 也不了解。因此，我们最终会有很多不安全的功能：我们从 `IB` 中按 `Ctrl` 键拖动到我们的代码中，将一些东西连接到一个动作，但如果我们随后删除该动作，代码仍然可以编译 - IB 真的不介意它打算调用的代码不再存在。

同样地，当我们从 storyboards 中创建视图控制器或删除表格视图单元时，我们使用字符串来识别代码中的重要对象--这个系统如此普遍，它甚至有自己的名字："字符串类型的 APIs"。即便如此，我们也需要使用类型转换，因为 Swift 无法知道它找回的表视图单元实际上是一个`MooncakeTableViewCell`。

这些问题的存在是因为 `IB` 和 `Swift` 是非常独立的东西。这并不令人惊讶 -- `Interface Builder` 不仅在最初的 `Mac OS X` 出现之前就已经存在，而且它在很大程度上是围绕 `Objective-C` 的工作方式设计的。

SwiftUI 与过去有了很大的区别。它是一个只适用于 `Swift` 的框架，并不是因为苹果决定现在是 `Objective-C` 消亡的时候了，而是因为它让 `SwiftUI` 利用了 `Swift` 的全部功能--值类型、不透明的返回类型、协议扩展等等。

不管怎么说，我们很快就会了解到 `SwiftUI` 的具体运作方式。现在，你至少需要知道的是，`SwiftUI` 解决了人们在旧的 `Swift` + `Interface Builder` 方法中遇到的许多问题。

* 我们不必再为程序化设计或基于 `storyboards` 的设计争论不休，因为 `SwiftUI` 同时提供了两者。
* 我们不再需要担心在提交用户界面相关的工作时产生源代码控制问题，因为代码比 `storyboards` 的 `XML` 更容易阅读和管理。
* 我们不再需要为字符串类型的 API 担心那么多--仍然有一些，但明显减少。
* 我们不再需要担心调用不存在的函数，因为我们的用户界面会被 `Swift` 编译器检查。

所以，我希望你会同意，迁移到 `SwiftUI` 有很多好处。

