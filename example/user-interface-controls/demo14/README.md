如何创建日期选择器 `DatePicker` 并从中读取值？
---

SwiftUI 的 `DatePicker` 视图类似于 `UIDatePicker`，并具有用于控制其外观和工作方式的各种选项。 像所有存储值的控件一样，它确实需要绑定到应用程序中的某种状态。

例如，这将创建一个绑定到 `birthDate` 属性的日期选择器，允许用户选择现在之前的任何日期，然后显示设置的日期选择器的值：

```swift
struct ContentView: View {
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()

    @State private var birthDate = Date()

    var body: some View {
        VStack {
            DatePicker(selection: $birthDate, in: ...Date(), displayedComponents: .date) {
                Text("Select a date")
            }

            Text("Date is \(birthDate, formatter: dateFormatter)")
        }
    }
}
```

您可以看到我已将 `displayComponents` 设置为 `.date`，但也可以使用 `.hourAndMinute` 来获取时间数据。

使用 `in:... Date()` 将日期范围指定为直到当前日期（包括当前日期）的所有内容，但之后不包含任何内容。 您可以使用 `in: Date()...` 进行相反的操作（即，允许从现在开始的日期），但是如果需要，也可以使用精确范围。

从 `iOS 14` 开始，您可以使用新的 `GraphicalDatePickerStyle()` 获得更高级的日期选择器，该选择器显示日历以及输入精确时间的空间：

```swift
struct ContentView: View {
    @State private var date = Date()

    var body: some View {
        VStack {
            Text("Enter your birthday")
                .font(.largeTitle)
            DatePicker("Enter your birthday", selection: $date)
                .datePickerStyle(GraphicalDatePickerStyle())
                .frame(maxHeight: 400)
        }
    }
}
```