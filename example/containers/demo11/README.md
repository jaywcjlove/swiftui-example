如何隐藏和显示 `NavigationView` 侧边栏？
---

在 `macOS` 中， 希望通过手动控制 `Sidebar` 的展示也隐藏。幸运的是，我们可以使用下面方法实现：

![](imgs/1.png)

```swift
struct ContentView: View {
    var body: some View {
        NavigationView {

        }.toolbar {
            ToolbarItem(placement: .navigation) {
                Button(action: toggleSidebar, label: {
                    Image(systemName: "sidebar.left")
                })
            }
        }
    }
}
func toggleSidebar() {
  #if os(macOS)
  NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
  #endif
}
```