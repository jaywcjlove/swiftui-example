如何使视图自行关闭？
===

当您使用工作表显示 `SwiftUI` 视图时，通常会在发生某些情况（例如，用户点击按钮）时关闭该视图。 在 `SwiftUI` 中，有两种解决方法，下面将向您展示两种方法，以便您确定最适合自己的需求。

第一种选择是告诉视图使用其表示模式环境键关闭视图。 任何视图都可以使用 `@Environment(\。presentationMode)` 读取其演示模式，并在该视图上调用 `wrappedValue.dismiss()`将导致该视图被关闭。

例如，我们可以创建一个详细信息视图，该视图能够使用其演示模式环境密钥自行关闭，然后从 `ContentView` 呈现该视图。

```swift
struct DismissingView1: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        Button("Dismiss Me") {
            presentationMode.wrappedValue.dismiss()
        }
    }
}

struct ContentView: View {
    @State private var showingDetail = false
    var body: some View {
        Button("Show Detail") {
            showingDetail = true
        }
        .sheet(isPresented: $showingDetail) {
            DismissingView1()
        }
    }
}
```

另一个选择是将绑定传递到显示的视图中，以便可以将绑定的值改回 `false`。 您仍然需要在呈现视图中具有某种状态属性，但是现在您将其作为绑定传递到详细信息视图中。

使用这种方法，详细信息视图将其绑定设置为 `false` 也会更新原始视图中的状态，从而导致详细信息视图不起作用-详细信息视图和原始视图都指向相同的布尔值，因此更改其中一个会更改另一个布尔值 地方也。

代码中的代码如下：

```swift
struct DismissingView2: View {
    @Binding var isPresented: Bool
    var body: some View {
        Button("Dismiss Me") {
            isPresented = false
        }
    }
}

struct ContentView: View {
    @State private var showingDetail = false
    var body: some View {
        Button("Show Detail") {
            showingDetail = true
        }
        .sheet(isPresented: $showingDetail) {
            DismissingView2(isPresented: $showingDetail)
        }
    }
}
```
