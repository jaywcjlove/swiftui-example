如何让用户使用 `ColorPicker` 选择颜色？
===

SwiftUI 具有一个本机的 `ColorPicker` 控件，该控件允许用户选择一种颜色。 要使用它，首先创建可以使用 `@State` 或类似方法更改的 `Color` 属性，然后

```swift
struct ContentView: View {
    @State private var bgColor = Color.red

    var body: some View {
        VStack {
            ColorPicker("Set the background color", selection: $bgColor)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(bgColor)
    }
}
```

默认情况下，`ColorPicker` 在颜色选择中支持不透明度，但是您可以使用稍微不同的初始化程序来禁用它：

```swift
struct ContentView: View {
    @State private var bgColor = Color.red

    var body: some View {
        VStack {
            ColorPicker("Set the background color", selection: $bgColor, supportsOpacity: false)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(bgColor)
    }
}
```