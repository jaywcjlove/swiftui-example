点击列表行时如何推送新视图？
----

轻按一行后，可以在列表行内使用 `SwiftUI` 的 `NavigationLink` 来显示新视图。如果 `NavigationLink` 环绕您的整个行，则系统会自动理解为可以轻敲整个行以呈现新视图。

为了说明这一点，以下代码创建了一个 `PlayerView`，该 `Viewer` 能够以粗体显示一位所选足球运动员的姓名。 然后，它为几个播放器创建一个列表，其中列表中的每一行都有一个 `NavigationLink`，该链接传递被点击的播放器的名称：

```swift
struct PlayerView: View {
    let name: String
    var body: some View {
        Text("Selected player: \(name)")
            .font(.largeTitle)
    }
}

struct ContentView: View {
    let players = [
        "Roy Kent",
        "Richard Montlaur",
        "Dani Rojas",
        "Jamie Tartt",
    ]

    var body: some View {
        NavigationView {
            List(players, id: \.self) { player in
                NavigationLink(destination: PlayerView(name: player)) {
                    Text(player)
                }
            }
            .navigationTitle("Select a player")
        }
    }
}
```

请注意，我们实际上是如何在导航链接中放置一个列表行的 – `SwiftUI` 由于其出色的编写能力而使其能够正常工作。