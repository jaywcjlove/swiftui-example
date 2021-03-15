如何使用 `@EnvironmentObject` 在视图之间共享数据
----

对于应与应用程序中的许多视图共享的数据，`SwiftUI` 为我们提供了 `@EnvironmentObject` 属性包装器。 这样一来，我们就可以在需要的任何地方共享模型数据，同时还可以确保在数据更改时我们的视图自动保持更新。

将 `@EnvironmentObject` 视为在许多视图上使用 `@ObservedObject` 的更智能，更简单的方法。 与其在视图 `A` 中创建一些数据，然后将其传递到视图 `B`，视图 `C`，然后在最终使用它之前将其传递给视图 `D`，您可以在视图中创建它并将其放入环境中，以便视图`B`，`C` 和 `D`将 自动访问它。

就像 `@ObservedObject` 一样，您永远不会将值分配给 `@EnvironmentObject` 属性。 相反，它应该从其他地方传入，最终您可能会想使用 `@StateObject` 在某个地方创建它。

但是，与 `@ObservedObject` 不同，我们不会手动将对象传递到其他视图中。 取而代之的是，我们将数据发送到一个名为 `environmentObject()` 的修饰符中，该修饰符使该对象及其视图中的其他视图在 `SwiftUI` 的环境中可用。

注意：环境对象必须由祖先视图提供-如果 `SwiftUI` 找不到正确类型的环境对象，则会崩溃。 这也适用于预览，因此请小心。

为了演示环境对象，我们将定义三件事：

- 一个 `GameSettings` 类，包含一个发布的单个属性，称为 `score`。
- 期望在环境中接收 `GameSettings` 对象的 `ScoreView` 视图，并显示其 `score` 属性。
- 创建一个 `GameSettings` 对象的 `ContentView` 视图，具有一个将其得分属性加1的按钮，以及一个用于显示详细信息视图的 `NavigationLink`。

这是代码：

```swift
// 我们的可观察对象类
class GameSettings: ObservableObject {
    @Published var score = 0
}

// 期望找到 GameSettings 对象的视图
// 在环境中，并显示其得分。
struct ScoreView: View {
    @EnvironmentObject var settings: GameSettings
    var body: some View {
        Text("Score: \(settings.score)")
    }
}

struct ContentView: View {
    @StateObject var settings = GameSettings()
    var body: some View {
        NavigationView {
            VStack {
                // 写入 environment settings 的按钮
                Button("Increase Score") {
                    settings.score += 1
                }
                NavigationLink(destination: ScoreView()) {
                    Text("Show Detail View")
                }
            }
            .frame(height: 200)
        }
        .environmentObject(settings)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```

我想在该代码中挑选出几个重要的部分：

- 就像 `@StateObject` 和 `@ObservedObject` 一样，与 `@EnvironmentObject` 一起使用的所有类都必须符合 `ObservableObject` 协议。
- 我们将 `GameSettings` 放入导航视图的环境中，这意味着导航视图内的所有视图都可以读取该对象（如果需要）以及该导航视图显示的任何视图。
- 使用 `@EnvironmentObject` 属性包装器时，您声明了您希望接收的东西的类型，但是您没有创建它-毕竟您希望从环境中接收它。
- 因为我们的详细信息视图显示在导航视图内部，所以它可以访问相同的环境，这又意味着它可以读取我们创建的 `GameSettings` 对象。
- 我们不需要将环境中的 `GameSettings` 实例与 `ScoreView` 中的 `settings` 属性显式关联- `SwiftUI` 会自动发现它在环境中具有 `GameSettings` 实例，因此就是它所使用的实例。

警告：既然我们的视图依赖于当前的环境对象，那么还必须更新预览代码以提供一些示例设置供您使用，这一点很重要。 例如，为预览使用诸如 `ScoreView()`。`environmentObject(GameSettings())` 之类的东西就可以做到。

如果需要向环境中添加多个对象，则应添加多个 `environmentObject()` 修饰符–只需一个接一个地调用它们即可。