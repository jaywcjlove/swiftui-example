如何返回不同的视图类型？
---

任何 `SwiftUI` 的 `body` 属性都可以自动返回不同的视图，这要归功于名为 `@ViewBuilder` 的特殊属性。 这是使用 `Swift` 的结果生成器系统实现的，它了解如何根据我们应用的状态显示两种不同的视图。

但是，并不是所有地方都自动具有相同的功能，这意味着您创建的任何自定义属性都必须返回相同的视图类型。

有四种方法可以解决此问题。 第一种选择是将输出包装在一个组中，这样，无论您发回图像还是文本视图，它们都将在一个组中返回：

```swift
struct ContentView: View {
    var tossResult: some View {
        Group {
            if Bool.random() {
                Image("laser-show")
                    .resizable()
                    .scaledToFit()
            } else {
                Text("Better luck next time")
                    .font(.title)
            }
        }
        .frame(width: 400, height: 300)
    }

    var body: some View {
        VStack {
            Text("Coin Flip")
                .font(.largeTitle)

            tossResult
        }
    }
}
```

第二种是使用可以返回的类型擦除包装器 `AnyView`：

```swift
struct ContentView: View {
    var tossResult: some View {
        if Bool.random() {
            return AnyView(Image("laser-show").resizable().scaledToFit())
        } else {
            return AnyView(Text("Better luck next time").font(.title))
        }
    }

    var body: some View {
        VStack {
            Text("Coin Flip")
                .font(.largeTitle)

            tossResult
                .frame(width: 400, height: 300)                
        }
    }
}
```

如果您还没有听说过这个概念，它会有效地迫使 `Swift` 忘记 `AnyView` 内部的特定类型，让他们看起来像是同一个人。 不过，这会降低性能，因此请不要经常使用。

尽管 `Group` 和 `AnyView` 的布局效果均相同，但在两者之间通常最好使用 `Group`，因为 `SwiftUI` 效率更高。

第三种选择是自己将 `@ViewBuilder` 属性应用于需要它的任何属性，如下所示：

```swift
struct ContentView: View {
    @ViewBuilder var tossResult: some View {
        if Bool.random() {
            Image("laser-show")
                .resizable()
                .scaledToFit()
        } else {
            Text("Better luck next time")
                .font(.title)
        }
    }

    var body: some View {
        VStack {
            Text("Coin Flip")
                .font(.largeTitle)

            tossResult
                .frame(width: 400, height: 300)                
        }
    }
}
```

那行得通，但是说实话，如果您发现自己想使用 `@ViewBuilder`，则应该质疑您是否试图在一个视图中放置太多内容。

第四个解决方案（大多数情况下效果最好）是将视图分解为较小的视图，然后根据需要将它们组合在一起：

```swift
struct TossResult: View {
    var body: some View {
        if Bool.random() {
            Image("laser-show")
                .resizable()
                .scaledToFit()
        } else {
            Text("Better luck next time")
                .font(.title)
        }
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Coin Flip")
                .font(.largeTitle)

            TossResult()
                .frame(width: 400, height: 300)
        }
    }
}
```

这非常有用，有助于打破逻辑和布局，还具有使视图在应用程序中其他位置更可重用的好处。`SwiftUI` 会自动折叠您的视图层次结构，因此在拆分视图时，性能没有任何有意义的区别。