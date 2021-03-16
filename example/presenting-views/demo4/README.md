如何使用图纸呈现新视图？
----

SwiftUI 的工作表用于在现有视图上显示新视图，同时仍允许用户向下拖动以在准备好新视图时将其关闭。

要使用工作表，请给它显示一些内容（一些文本，图像，自定义视图等），添加一个布尔值以定义是否应显示详细信息视图，然后将其作为模式表附加到您的主视图。

例如，这将创建一个简单的详细信息视图，然后在轻按按钮时从 `ContentView` 呈现它：

```swift
struct SheetView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        Button("Press to dismiss") {
            presentationMode.wrappedValue.dismiss()
        }
        .font(.title)
        .padding()
        .background(Color.black)
    }
}

struct ContentView: View {
    @State private var showingSheet = false
    var body: some View {
        Button("Show Sheet") {
            showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet) {
            SheetView()
        }
    }
}
```

与导航链接不同，工作表不需要导航视图即可工作。

提示：如果您不希望通过在 `iOS` 上向下拖动来关闭工作表，请改用 `fullScreenCover()` 修饰符。

`SwiftUI` 的 `fullScreenCover()` 修饰符为我们提供了一种呈现样式，用于您想要覆盖尽可能多的屏幕的时间，并且在代码中，它的工作方式与常规工作表几乎相同。

可以通过向下拖动常规工作表来关闭常规工作表，但是使用 `fullScreenCover()` 呈现的视图则无法实现。 因此，很重要的一点是，您可能需要使用 `presentationMode` 环境密钥来提供一种方法来关闭呈现的视图。

例如，这定义了一个简单的 `FullScreenModalView` 结构，该结构可以关闭自身，然后在按下另一个按钮时从 `ContentView` 中呈现它：

```swift
struct FullScreenModalView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        Button("Dismiss Modal") {
            presentationMode.wrappedValue.dismiss()
        }
    }
}

struct ContentView: View {
    @State private var isPresented = false
    var body: some View {
        Button("Present!") {
            isPresented.toggle()
        }
        .fullScreenCover(isPresented: $isPresented, content: FullScreenModalView.init)
    }
}
```

⚠️ 重要：macOS 上没有 `fullScreenCover()`。
