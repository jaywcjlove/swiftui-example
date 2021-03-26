如何隐藏和显示 `NavigationView` 侧边栏？
---

在 `macOS` 中， 希望通过手动控制 `Sidebar` 的展示也隐藏。幸运的是，我们可以使用下面方法实现：

```swift
struct ContentView: View {
    @State private var users = ["Paul", "Taylor", "Adele"]
    @State var select: String? = "Paul"
    var body: some View {
        NavigationView {
            List {
                ForEach(users.indices, id: \.self) { index in
                    NavigationLink(destination: Text(users[index]), tag: users[index], selection: $select) {
                        Text(users[index])
                            .padding(.vertical, 2.0)
                    }
                }
            }
            .listStyle(SidebarListStyle())
        }
        .toolbar {
            Text("this is not the title")
            Button(action: toggleSidebar) {
                Label("Upload", systemImage: "square.righthalf.fill")
            }
        }
        .listStyle(SidebarListStyle())
    }
    private func toggleSidebar() {
        #if os(macOS)
        NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
        #endif
    }
}
```