如何使用 @StateObject 创建和监视外部对象
----

`SwiftUI` 的 `@StateObject` 属性包装器是 `@ObservedObject` 的一种特殊形式，具有所有相同的功能，但还有一个重要的附加功能：它应该用于创建观察到的对象，而不仅仅是存储从外部传入的对象。

当您使用 `@StateObject` 向视图添加属性时，`SwiftUI` 认为该视图是可观察对象的所有者。 传递该对象的所有其他视图应使用 `@ObservedObject`。

这真的很重要。 严重的是，如果您弄错了，您的对象可能会被意外破坏，这将导致您的应用看似随机崩溃。

因此，要明确一点：您应该使用 `@StateObject` 在某个位置创建可观察对象，并且在传递该对象的所有后续位置中，都应该使用 `@ObservedObject`。

这是代码示例：

```swift
class Player: ObservableObject {
  @Published var name = "Taylor"
  @Published var age = 26
}

struct ContentView: View {
  @StateObject var player = Player()
  var body: some View {
    NavigationView {
      NavigationLink(destination: PlayerNameView(player: player)) {
          Text("Show detail view")
      }
    }
  }
}

struct PlayerNameView: View {
  @ObservedObject var player: Player

  var body: some View {
      Text("Hello, \(player.name)!")
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
      ContentView()
  }
}
```