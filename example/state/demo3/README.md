如何使用 `@ObservedObject` 管理外部对象的状态
----

使用观察对象时，我们需要处理三个关键事项：`ObservableObject` 协议与某种可以存储数据的类一起使用，`@ObservedObject` 属性包装器用于在视图内部存储可观察对象的实例，以及 `@Published` 的属性包装器将添加到观察对象内部的任何属性，这些属性应导致视图在更改时进行更新。

提示：仅将 `@ObservedObject` 用于从其他位置传入的视图，这一点非常重要。 您不应使用此属性包装器来创建可观察对象的初始实例，这就是 `@StateObject` 的目的。

举例来说，这是一个符合 `ObservableObject` 的 `UserProgress` 类：

```swift
class UserProgress: ObservableObject {
    @Published var score = 0
}
```

我知道代码看起来不多，但这是因为 `SwiftUI` 代表我们做了很多工作！ 里面有两件事很重要：

- `ObservableObject`一致性允许在视图内部使用此类的实例，以便在发生重要更改时重新加载视图。 
- `@Published` 属性包装器告诉 `SwiftUI` 得分的更改应触发视图重新加载。

我们可以将 `UserProgress` 类与以下代码一起使用：

```swift
class UserProgress: ObservableObject {
    @Published var score = 0
}

struct InnerView: View {
    @ObservedObject var progress: UserProgress
    var body: some View {
        Button("Increase Score") {
            progress.score += 1
        }
    }
}

struct ContentView: View {
    @StateObject var progress = UserProgress()
    var body: some View {
        VStack {
            Text("Your score is \(progress.score)")
            InnerView(progress: progress)
        }
        .padding(100)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```

如您所见，除了使用 `@ObservedObject` 属性包装器进行进度处理外，其他所有内容或多或少看起来都是相同的– `SwiftUI` 为我们处理了所有实现细节。

不过，有一个重要的区别：`progress` 属性未声明为私有。 这是因为绑定的对象可以被多个视图使用，因此通常将其公开共享。

请记住，请不要使用 `@ObservedObject` 创建对象的实例。 如果您要这样做，请改用 `@StateObject`。