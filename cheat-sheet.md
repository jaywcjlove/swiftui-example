SwiftUI 速查手册
---

<details>
<summary>SwiftUI 与 UIKit 效果一致</summary>

| UIKit | [SwiftUI](https://developer.apple.com/xcode/swiftui/) |
| ----------- | ----------- |
| UILabel | [Text](#user-content-text) & [Label](#user-content-label)|
| UIImageView | [Image](#user-content-image) |
| UITextField | [TextField](#user-content-textfield) |
| UITextView | [TextEditor](#user-content-texteditor) |
| UISwitch | [Toggle](#user-content-toggle) |
| UISlider | [Slider](#user-content-slider) |
| UIButton | [Button](#user-content-button) |
| UITableView | [List](#user-content-list) |
| UICollectionView | [LazyVGrid](#user-content-lazyvgrid) / [LazyHGrid](#user-content-lazyhgrid) |
| UINavigationController | [NavigationView](#user-content-navigationview) |
| UITabBarController | [TabView](#user-content-tabview) |
| UIAlertController with style .alert | [Alert](#user-content-alerts-and-action-sheets) |
| UIAlertController with style .actionSheet | [ActionSheet](#user-content-alerts-and-action-sheets) |
| UIStackView with horizontal axis| [HStack](#user-content-hstack) / [LazyHStack](#user-content-lazyhstack) |
| UIStackView with vertical axis| [VStack](#user-content-vstack) / [LazyVStack](#user-content-lazyvstack) |
| UISegmentedControl | [Picker](#user-content-picker) |
| UIStepper | [Stepper](#user-content-stepper) |
| UIDatePicker | [DatePicker](#user-content-date-picker) |
| NSAttributedString | No equivalent (use [Text](#user-content-text)) |
| MapKit | [Map](#user-content-map) |
| UIProgressView | [ProgressView](#user-content-progressview) |


</details>

## View

<details>
<summary id="Text">Text</summary>

```swift
Text("Hello World")
```

添加样式

```swift
Text("Hello World")
    .font(.largeTitle)
    .foregroundColor(Color.green)
    .lineSpacing(50)
    .lineLimit(nil)
    .padding()
```

在文本视图中格式化文本

```swift
static let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .long
    return formatter
}()

var now = Date()
var body: some View {
    Text("Task due date: \(now, formatter: Self.dateFormatter)")
}
```

</details>


<details>
<summary id="Label">Label</summary>

可以使用以下代码行在文本旁边设置图标。

```swift
Label("SwiftUI CheatSheet", systemImage: "up.icloud")
```

可以设置URL，单击后将重定向到浏览器。

```swift
Link("Click me",destination: URL(string: "your_url")!)
```

</details>


<details>
<summary id="TextEditor">TextEditor 多行可滚动文本编辑器</summary>
</details>


<details>
<summary id="Image">Image 图片</summary>
</details>


<details>
<summary id="Image">Image 图片</summary>
</details>
