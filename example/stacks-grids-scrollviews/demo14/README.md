如何使用 `HSplitViews` 创建左中右三栏布局？
===

使用 `HSplitViews` 布局容器，将其子级排列在一条水平线上，并允许用户使用放置在它们之间的分隔符来调整它们的大小。

![](imgs/1.png)

```swift
struct ContentView: View {
   var body: some View {
      GeometryReader{geometry in
         HSplitView(){
            Rectangle()
                .frame(minWidth: 0, idealWidth: 200, maxWidth: .infinity)
            HSplitView(){
                Rectangle().layoutPriority(1)
                Rectangle().foregroundColor(.green).frame(minWidth:200, idealWidth: 200, maxWidth: .infinity)
            }.layoutPriority(1)
         }
         .frame(width: geometry.size.width, height: geometry.size.height)
      }
   }
}
```