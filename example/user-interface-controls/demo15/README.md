如何创建分段控件并从中读取值？
---

SwiftUI 的 `Picker` 也可以用来创建与 `UIKit` 中的 `UISegmentedControl` 等效的分段控件，尽管它需要绑定到某种状态，并且您必须确保为每个分段提供一个标签，以便于对其进行识别。 段可以是文本或图片； 其他任何事情都会悄无声息地失败。

例如，这将创建一个与 `favouriteColorColor` 状态属性一起使用的分段控件，并在下面添加一个文本视图，该文本视图显示所选的任何值： 

```swift
struct ContentView: View {
    @State private var favoriteColor = 0

    var body: some View {
        VStack {
            Picker(selection: $favoriteColor, label: Text("What is your favorite color?")) {
                Text("Red").tag(0)
                Text("Green").tag(1)
                Text("Blue").tag(2)
            }
            .pickerStyle(SegmentedPickerStyle())

            Text("Value: \(favoriteColor)")
        }
    }
}
```

不过，在这种情况下，最好创建一个数组来存储各种颜色，然后使用 `ForEach` 通过循环在内部创建文本视图：

```swift
struct ContentView: View {
    @State private var favoriteColor = "Red"
    var colors = ["Red", "Green", "Blue"]

    var body: some View {
        VStack {
            Picker(selection: $favoriteColor, label: Text("What is your favorite color?")) {
                ForEach(colors, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(SegmentedPickerStyle())

            Text("Value: \(favoriteColor)")
        }
    }
}
```