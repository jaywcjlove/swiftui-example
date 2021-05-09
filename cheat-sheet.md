SwiftUI 速查手册
---

<details>
<summary>SwiftUI 与 UIKit 效果一致</summary>

| UIKit | [SwiftUI](https://developer.apple.com/xcode/swiftui/) |
| ----------- | ----------- |
| UILabel | [Text](#user-content-text) & [Label](#user-content-label)|
| UIImageView | [Image](#user-content-image) |
| UITextField | [TextField](#user-content-textfield) / [SecureField](#user-content-securefield) |
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
| - | [Modal](#user-content-modal) |
| - | [ScrollView](#user-content-scrollview) |
| - | [Form](#user-content-form) |
| - | [Spacer](#user-content-spacer) |
| - | [Divider](#user-content-divider) |


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
Link("Click me", destination: URL(string: "your_url")!)
```

Documentation - [Label](https://developer.apple.com/documentation/swiftui/label)

</details>


<details>
<summary id="TextEditor">TextEditor 多行可滚动文本编辑器</summary>

可以显示和编辑长格式文本的视图。

```swift
@State private var fullText: String = "This is some editable text..."

var body: some View {
    TextEditor(text: $fullText)
}
```

设置 `TextEditor` 背景颜色

```swift
extension NSTextView {
    open override var frame: CGRect {
        didSet {
            backgroundColor = .clear
//            drawsBackground = true
        }

    }
}

struct DetailContent: View {
    @State private var profileText: String = "Enter your bio"
    var body: some View {
        VSplitView(){
            TextEditor(text: $profileText)
                .background(Color.red)
        }
    }
}
```

Documentation - [TextEditor](https://developer.apple.com/documentation/swiftui/texteditor)

</details>


<details>
<summary id="Image">Image</summary>

显示与环境相关的图像的视图。

```swift
Image("foo") // 图像名称是foo
```

我们可以使用新的 `SF Symbols`

```swift
Image(systemName: "clock.fill")
```

您可以向系统图标集添加样式以匹配您使用的字体

```swift
Image(systemName: "cloud.heavyrain.fill")
    .foregroundColor(.red)
    .font(.title)
Image(systemName: "clock")
    .foregroundColor(.red)
    .font(Font.system(.largeTitle).bold())
```

为图像添加样式

```swift
Image("foo")
    .resizable() // 它将调整大小，以便填充所有可用空间
    .aspectRatio(contentMode: .fit)
```

Documentation - [Image](https://developer.apple.com/documentation/swiftui/image)

</details>


<details>
<summary id="TextField">TextField</summary>

显示可编辑文本界面的控件。

```swift
@State var name: String = "John"    
var body: some View {
    TextField("Name's placeholder", text: $name)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .padding()
}
```

取消编辑框焦点样式。

```swift
extension NSTextField { // << workaround !!!
    open override var focusRingType: NSFocusRingType {
        get { .none }
        set { }
    }
}
```

如何居中放置 `TextField` 的文本

```swift
struct ContentView: View {
    @State var text: String = "TextField Text"
    var body: some View {
        TextField("Placeholder Text", text: $text)
            .padding(.all, 20)
            .multilineTextAlignment(.center)
    }
}
```

Documentation - [TextField](https://developer.apple.com/documentation/swiftui/textfield)

</details>


<details>
<summary id="SecureField">SecureField</summary>

用户安全地输入私人文本的控件。

```swift
@State var password: String = "1234"    
var body: some View {
    SecureField($password)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .padding()
}
```

Documentation - [SecureField](https://developer.apple.com/documentation/swiftui/securefield)

</details>


<details>
<summary id="Toggle">Toggle</summary>

在打开和关闭状态之间切换的控件。

```swift
@State var isShowing = true // toggle state

Toggle(isOn: $isShowing) {
    Text("Hello World")
}
```

如果您的 `Toggle` 的标签只有 `Text`，则可以使用此更简单的签名进行初始化。

```swift
Toggle("Hello World", isOn: $isShowing)
```

Documentation - [Toggle](https://developer.apple.com/documentation/swiftui/toggle)

</details>


<details>
<summary id="Slider">Slider</summary>

用于从值的有界线性范围中选择一个值的控件。

```swift
@State var progress: Float = 0

Slider(value: $progress, from: 0.0, through: 100.0, by: 5.0)
```

滑块缺少 `minimumValueImage` 和 `maximumValueImage`，但是我们可以通过 `HStack` 轻松地复制它

```swift
@State var progress: Float = 0
HStack {
    Image(systemName: "sun.min")
    Slider(value: $progress, from: 0.0, through: 100.0, by: 5.0)
    Image(systemName: "sun.max.fill")
}.padding()
```

Documentation - [Slider](https://developer.apple.com/documentation/swiftui/slider)

</details>


<details>
<summary id="Slider">Button</summary>

在触发时执行操作的控件。

```swift
Button(
    action: {
        print("did tap")
    },
    label: { Text("Click Me") }
)
```

如果 `Button` 的标签仅为 `Text`，则可以使用此更简单的签名进行初始化。

```swift
Button("Click Me") {
    print("did tap")
}
```

您可以通过此按钮了解一下

```swift
Button(action: {
    // 退出应用
    NSApplication.shared.terminate(self)
}, label: {
    Image(systemName: "clock")
    Text("Click Me")
    Text("Subtitle")
})
.foregroundColor(Color.white)
.padding()
.background(Color.blue)
.cornerRadius(5)
```

Documentation - [Button](https://developer.apple.com/documentation/swiftui/button)

</details>


<details>
<summary id="TabView">TabView</summary>

一个视图，允许使用可交互的用户界面元素在多个子视图之间进行切换。

```swift
TabView {
    Text("First View")
        .font(.title)
        .tabItem({ Text("First") })
        .tag(0)
    Text("Second View")
        .font(.title)
        .tabItem({ Text("Second") })
        .tag(1)
}
```

图像和文本在一起。 您可以在此处使用 `SF Symbol`。

```swift
TabView {
    Text("First View")
        .font(.title)
        .tabItem({
            Image(systemName: "circle")
            Text("First")
        })
        .tag(0)
    Text("Second View")
        .font(.title)
        .tabItem(VStack {
            Image("second")
            Text("Second")
        })
        .tag(1)
}
```

</details>


<details>
<summary id="Picker">Picker</summary>

用于从一组互斥值中进行选择的控件。

选择器样式的更改基于其祖先，在 `Form` 或 `List` 下，它显示为单个列表行，您可以点击以进入一个显示所有可能选项的新屏幕。

```swift
NavigationView {
    Form {
        Section {
            Picker(selection: $selection, label:
                Text("Picker Name")
                , content: {
                    Text("Value 1").tag(0)
                    Text("Value 2").tag(1)
                    Text("Value 3").tag(2)
                    Text("Value 4").tag(3)
            })
        }
    }
}
```
您可以使用 `.pickerStyle(WheelPickerStyle())` 覆盖样式。

在 `SwiftUI` 中，`UISegmentedControl` 只是 `Picker`的另一种样式。

```swift
@State var mapChoioce = 0
var settings = ["Map", "Transit", "Satellite"]
Picker("Options", selection: $mapChoioce) {
    ForEach(0 ..< settings.count) { index in
        Text(self.settings[index])
            .tag(index)
    }

}.pickerStyle(SegmentedPickerStyle())
```

分段控制(SegmentedControl)在 `iOS 13` 中也焕然一新

Documentation - [Picker](https://developer.apple.com/documentation/swiftui/picker)

</details>


<details>
<summary id="Stepper">Stepper</summary>

用于执行语义递增和递减操作的控件。

```swift
@State var quantity: Int = 0
Stepper(value: $quantity, in: 0...10, label: { Text("Quantity \(quantity)")})
```

如果 `Stepper` 的标签只有 `Text`，则可以使用此更简单的签名进行初始化。

```swift
Stepper("Quantity \(quantity)", value: $quantity, in: 0...10)
```

如果要完全控制，他们可以提供裸机步进器，您可以在其中管理自己的数据源。

```swift
@State var quantity: Int = 0
Stepper(onIncrement: {
    self.quantity += 1
}, onDecrement: {
    self.quantity -= 1
}, label: { Text("Quantity \(quantity)") })
```

如果您还为带有 `step` 的初始化程序的每个步骤指定了一个值的数量。

```swift
Stepper(value: $quantity, in: 0...10, step: 2) {
    Text("Quantity \(quantity)")
}
```

Documentation - [Stepper](https://developer.apple.com/documentation/swiftui/stepper)

</details>


<details>
<summary id="DatePicker">DatePicker</summary>

用于选择绝对日期的控件。


日期选择器(DatePicker)的样式也会根据其祖先而改变。 在 `Form` 或 `List` 下，它显示为单个列表行，您可以点击以展开到日期选择器（就像日历应用程序一样）。

```swift
@State var selectedDate = Date()

var dateClosedRange: ClosedRange<Date> {
    let min = Calendar.current.date(byAdding: .day, value: -1, to: Date())!
    let max = Calendar.current.date(byAdding: .day, value: 1, to: Date())!
    return min...max
}
NavigationView {
    Form {
        Section {
            DatePicker(
                selection: $selectedDate,
                in: dateClosedRange,
                displayedComponents: .date,
                label: { Text("Due Date") }
            )
        }
    }
}
```

在表格和列表的外部，它显示为普通的轮式拾取器

```swift
@State var selectedDate = Date()

var dateClosedRange: ClosedRange<Date> {
    let min = Calendar.current.date(byAdding: .day, value: -1, to: Date())!
    let max = Calendar.current.date(byAdding: .day, value: 1, to: Date())!
    return min...max
}

DatePicker(
    selection: $selectedDate,
    in: dateClosedRange,
    displayedComponents: [.hourAndMinute, .date],
    label: { Text("Due Date") }
)
```

如果 `DatePicker` 的标签仅是纯文本，则可以使用此更简单的签名进行初始化。

```swift
DatePicker("Due Date",
            selection: $selectedDate,
            in: dateClosedRange,
            displayedComponents: [.hourAndMinute, .date])
```

可以使用 `ClosedRange`，`PartialRangeThrough` 和 `PartialRangeFrom` 来设置 `minimumDate` 和 `maximumDate`。

```swift
DatePicker("Minimum Date",
    selection: $selectedDate,
    in: Date()...,
    displayedComponents: [.date])
DatePicker("Maximum Date",
    selection: $selectedDate,
    in: ...Date(),
    displayedComponents: [.date])
```

Documentation - [DatePicker](https://developer.apple.com/documentation/swiftui/datepicker)

</details>


<details>
<summary id="Map">Map</summary>

显示嵌入式地图界面的视图。

显示指定区域的地图

```swift
import MapKit

@State var region = MKCoordinateRegion(center: .init(latitude: 37.334722, longitude: -122.008889), latitudinalMeters: 300, longitudinalMeters: 300)
    
Map(coordinateRegion: $region)
```

您可以通过指定 `interactionModes`（使用`[]`禁用所有交互）来控制地图的交互。

```swift
struct PinItem: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}

Map(coordinateRegion: $region, 
    interactionModes: [], 
    showsUserLocation: true, 
    userTrackingMode: nil, 
    annotationItems: [PinItem(coordinate: .init(latitude: 37.334722, longitude: -122.008889))]) { item in                    
    MapMarker(coordinate: item.coordinate)
}
```

Documentation - [Map](https://developer.apple.com/documentation/mapkit/map)

</details>


<details>
<summary id="ProgressView">ProgressView</summary>

显示任务完成进度的视图。

```swift
@State private var progress = 0.5

VStack {
    ProgressView(value: progress)
    Button("More", action: { progress += 0.05 })
}
```

通过应用 `CircularProgressViewStyle`，可以将其用作 `UIActivityIndicatorView`。

```swift
ProgressView(value: progress)
    .progressViewStyle(CircularProgressViewStyle())
```

Documentation - [ProgressView](https://developer.apple.com/documentation/swiftui/progressview)

</details>

## 查看布局和演示

<details>
<summary id="HStack">HStack</summary>

将其子级排列在一条水平线上的视图。

创建静态可滚动列表

```swift
HStack (alignment: .center, spacing: 20){
    Text("Hello")
    Divider()
    Text("World")
}
```

Documentation - HStack

</details>


<details>
<summary id="LazyHStack">LazyHStack</summary>

将子项排列在水平增长的线中的视图，仅在需要时创建项。

```swift
ScrollView(.horizontal) {
    LazyHStack(alignment: .center, spacing: 20) {
        ForEach(1...100, id: \.self) {
            Text("Column \($0)")
        }
    }
}
```

Documentation - LazyHStack

</details>


<details>
<summary id="VStack">VStack</summary>

以垂直线排列其子项的视图。

创建静态可滚动列表

```swift
VStack (alignment: .center, spacing: 20){
    Text("Hello")
    Divider()
    Text("World")
}
```

Documentation - VStack

</details>


<details>
<summary id="LazyVStack">LazyVStack</summary>

`iOS 14`

一种视图，将其子级排列在垂直增长的线中，仅在需要时创建项。

```swift
ScrollView {
    LazyVStack(alignment: .leading) {
        ForEach(1...100, id: \.self) {
            Text("Row \($0)")
        }
    }
}
```

Documentation - [LazyVStack](https://developer.apple.com/documentation/swiftui/lazyvstack)

</details>


<details>
<summary id="ZStack">ZStack</summary>

覆盖其子项的视图，使子项在两个轴上对齐。

```swift
ZStack {
    Text("Hello")
        .padding(10)
        .background(Color.red)
        .opacity(0.8)
    Text("World")
        .padding(20)
        .background(Color.red)
        .offset(x: 0, y: 40)
}
```

Documentation - ZStack

</details>


<details>
<summary id="List">List</summary>

一个容器，用于显示排列在单列中的数据行。

创建静态可滚动列表

```swift
List {
    Text("Hello world")
    Text("Hello world")
    Text("Hello world")
}
```

可混合的列表

```swift
List {
    Text("Hello world")
    Image(systemName: "clock")
}
```

创建动态列表

```swift
let names = ["John", "Apple", "Seed"]
List(names) { name in
    Text(name)
}
```

添加 `Section`

```swift
List {
    Section(header: Text("UIKit"), footer: Text("We will miss you")) {
        Text("UITableView")
    }

    Section(header: Text("SwiftUI"), footer: Text("A lot to learn")) {
        Text("List")
    }
}
```

要使其分组，请添加 `.listStyle(GroupedListStyle())`

```swift
List {
    Section(header: Text("UIKit"), footer: Text("We will miss you")) {
        Text("UITableView")
    }

    Section(header: Text("SwiftUI"), footer: Text("A lot to learn")) {
        Text("List")
    }
}.listStyle(GroupedListStyle())
```

要使其插入分组(`.insetGrouped`)，请添加 `.listStyle(GroupedListStyle())` 并强制使用常规水平尺寸类 ``.environment(\.horizontalSizeClass, .regular)``。

```swift
List {
    Section(header: Text("UIKit"), footer: Text("We will miss you")) {
        Text("UITableView")
    }

    Section(header: Text("SwiftUI"), footer: Text("A lot to learn")) {
        Text("List")
    }
}.listStyle(GroupedListStyle())
.environment(\.horizontalSizeClass, .regular)
```

> 插图分组已添加到 `iOS 13.2` 中的 `SwiftUI`

`iOS 14`

在 `iOS 14` 中，我们为此设置了专用样式。

```swift
.listStyle(InsetGroupedListStyle())
```

Documentation - [List](https://developer.apple.com/documentation/swiftui/list)

</details>


<details>
<summary id="ScrollView">ScrollView</summary>

滚动视图。

```swift
ScrollView(alwaysBounceVertical: true) {
    Image("foo")
    Text("Hello World")
}
```

Documentation - [ScrollView](https://developer.apple.com/documentation/swiftui/scrollview)

</details>


<details>
<summary id="LazyHGrid">LazyHGrid</summary>

一种容器视图，将其子视图排列在水平增长的网格中，仅在需要时创建项目。

```swift
var rows: [GridItem] =
        Array(repeating: .init(.fixed(20)), count: 2)

ScrollView(.horizontal) {
    LazyHGrid(rows: rows, alignment: .top) {
        ForEach((0...100), id: \.self) {
            Text("\($0)").background(Color.pink)
        }
    }
}
```

Documentation - [LazyHGrid](https://developer.apple.com/documentation/swiftui/lazyhgrid)

</details>


<details>
<summary id="LazyVGrid">LazyVGrid</summary>

容器视图，将其子视图排列在垂直增长的网格中，仅在需要时创建项目。

```swift
var columns: [GridItem] = Array(repeating: .init(.fixed(20)), count: 5)

ScrollView {
    LazyVGrid(columns: columns) {
        ForEach((0...100), id: \.self) {
            Text("\($0)").background(Color.pink)
        }
    }
}
```

Documentation - [LazyVGrid](https://developer.apple.com/documentation/swiftui/lazyvgrid)

</details>


<details>
<summary id="Form">Form</summary>

用于对用于数据输入的控件（例如在设置或检查器中）进行分组的容器。

您几乎可以在此表单中放入任何内容，它将为表单呈现适当的样式。

```swift
NavigationView {
    Form {
        Section {
            Text("Plain Text")
            Stepper(value: $quantity, in: 0...10, label: { Text("Quantity") })
        }
        Section {
            DatePicker($date, label: { Text("Due Date") })
            Picker(selection: $selection, label:
                Text("Picker Name")
                , content: {
                    Text("Value 1").tag(0)
                    Text("Value 2").tag(1)
                    Text("Value 3").tag(2)
                    Text("Value 4").tag(3)
            })
        }
    }
}
```

Documentation - [Form](https://developer.apple.com/documentation/swiftui/form)

</details>


<details>
<summary id="Spacer">Spacer</summary>

沿其包含的堆栈布局的主轴或如果不包含在堆栈中的两个轴上扩展的灵活空间。

```swift
HStack {
    Image(systemName: "clock")
    Spacer()
    Text("Time")
}
```

Documentation - [Spacer](https://developer.apple.com/documentation/swiftui/spacer)

</details>


<details>
<summary id="Divider">Divider</summary>

可用于分隔其他内容的视觉元素。

```swift
HStack {
    Image(systemName: "clock")
    Divider()
    Text("Time")
}.fixedSize()
```

Documentation - [Divider](https://developer.apple.com/documentation/swiftui/divider)

</details>


<details>
<summary id="NavigationView">NavigationView</summary>

用于呈现视图堆栈的视图，这些视图表示导航层次结构中的可见路径。

```swift
NavigationView {            
    List {
        Text("Hello World")
    }
    .navigationBarTitle(Text("Navigation Title")) // Default to large title style
}
```

对于旧样式标题

```swift
NavigationView {            
    List {
        Text("Hello World")
    }
    .navigationBarTitle(Text("Navigation Title"), displayMode: .inline)
}
```

添加 `UIBarButtonItem`

```swift
NavigationView {
    List {
        Text("Hello World")
    }
    .navigationBarItems(trailing:
        Button(action: {
            // Add action
        }, label: {
            Text("Add")
        })
    )
    .navigationBarTitle(Text("Navigation Title"))
}
```

使用 [NavigationLink](https://fuckingswiftui.com/#navigationlink) 添加显示/推送

用作 `UISplitViewController`。

```swift
NavigationView {
    List {
        NavigationLink("Go to detail", destination: Text("New Detail"))
    }.navigationBarTitle("Master")
    Text("Placeholder for Detail")
}
```

您可以使用两个新的样式属性为 `NavigationView` 设置样式：`stack和doubleColumn`。 默认情况下，`iPhone` 和 `Apple TV` 上的导航视图在视觉上反映了导航堆栈，而在 `iPad` 和 `Mac` 上，显示的是拆分视图样式的导航视图。

您可以使用 `.navigationViewStyle` 覆盖它。

```swift
NavigationView {
    MyMasterView()
    MyDetailView()
}
.navigationViewStyle(StackNavigationViewStyle())
```

`iOS 14`

在 `iOS 14` 中，`UISplitViewController` 有新的侧边栏样式。 您也可以通过在 `NavigationView` 下放置三个视图来做到这一点。

```swift
NavigationView {
    Text("Sidebar")
    Text("Primary")
    Text("Detail")
}
```

Documentation - [NavigationView](https://developer.apple.com/documentation/swiftui/navigationview)

`iOS 14`

在 `UIViewController` 中添加 `UIToolbar`，如 `toolbarItems`。

```swift
NavigationView {
    Text("SwiftUI").padding()
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                Button {

                } label: {
                    Image(systemName: "archivebox")
                }
            }
            
            ToolbarItem(placement: .bottomBar) {
                Spacer()
            }
            
            ToolbarItem(placement: .bottomBar) {                
                Button {
                    
                } label: {
                    Image(systemName: "square.and.pencil")
                }                
            }
        }
}
```

Documentation - [ToolbarItem](https://developer.apple.com/documentation/swiftui/toolbaritem)

</details>


<details>
<summary id="TabView">TabView</summary>

一个视图，允许使用可交互的用户界面元素在多个子视图之间进行切换。

```swift
TabView {
    Text("First View")
        .font(.title)
        .tabItem({ Text("First") })
        .tag(0)
    Text("Second View")
        .font(.title)
        .tabItem({ Text("Second") })
        .tag(1)
}
```

图像和文本在一起。 您可以在此处使用 `SF Symbol`。

```swift
TabView {
    Text("First View")
        .font(.title)
        .tabItem({
            Image(systemName: "circle")
            Text("First")
        })
        .tag(0)
    Text("Second View")
        .font(.title)
        .tabItem(VStack {
            Image("second")
            Text("Second")
        })
        .tag(1)
}
```

或者您可以省略 `VStack`

```swift
TabView {
    Text("First View")
        .font(.title)
        .tabItem({
            Image(systemName: "circle")
            Text("First")
        })
        .tag(0)
    Text("Second View")
        .font(.title)
        .tabItem({
            Image("second")
            Text("Second")
        })
        .tag(1)
}
```

</details>


<details>
<summary id="Alert">Alert</summary>

警报演示的容器。

我们可以根据布尔值显示Alert。

```swift
@State var isError: Bool = false

Button("Alert") {
    self.isError = true
}.alert(isPresented: $isError, content: {
    Alert(title: Text("Error"), message: Text("Error Reason"), dismissButton: .default(Text("OK")))
})
```

它也与可识别项绑定。

```swift
@State var error: AlertError?

var body: some View {
    Button("Alert Error") {
        self.error = AlertError(reason: "Reason")
    }.alert(item: $error, content: { error in
        alert(reason: error.reason)
    })    
}

func alert(reason: String) -> Alert {
    Alert(title: Text("Error"),
            message: Text(reason),
            dismissButton: .default(Text("OK"))
    )
}

struct AlertError: Identifiable {
    var id: String {
        return reason
    }
    
    let reason: String
}
```

Documentation - [Alert](https://developer.apple.com/documentation/swiftui/alert)

</details>


<details>
<summary id="Modal">Modal</summary>

Modal 过渡。

我们可以显示基于布尔的 Modal。

```swift
@State var isModal: Bool = false

var modal: some View {
    Text("Modal")
}

Button("Modal") {
    self.isModal = true
}.sheet(isPresented: $isModal, content: {
    self.modal
})
```

Documentation - [Sheet](https://developer.apple.com/documentation/swiftui/view/3352791-sheet)

它也与可识别项绑定。

```swift
@State var detail: ModalDetail?

var body: some View {
    Button("Modal") {
        self.detail = ModalDetail(body: "Detail")
    }.sheet(item: $detail, content: { detail in
        self.modal(detail: detail.body)
    })    
}

func modal(detail: String) -> some View {
    Text(detail)
}

struct ModalDetail: Identifiable {
    var id: String {
        return body
    }
    
    let body: String
}
```

Documentation - [Sheet](https://developer.apple.com/documentation/swiftui/view/3352792-sheet)

`iOS 14`

如果要使用模式显示以全屏显示的旧模式显示，可以使用 `.fullScreenCover` 而不是 `.sheet`。

由于全屏封面样式不允许用户使用手势来消除模态，因此您必须添加一种方法来手动消除呈现的视图。 在下面的示例中，我们通过将 `isModal` 设置为 `false` 来添加一个按钮来消除显示的视图。

```swift
@State var isModal: Bool = false

var modal: some View {
Text("Modal")
      Button("Dismiss") {
        self.isModal = false
      }
}

Button("Fullscreen") {
    self.isModal = true
}.fullScreenCover(isPresented: $isFullscreen, content: {
      self.modal
    })
```

如果您将自定义视图用作模式，则可以使用 `presentationMode` 环境键关闭显示的视图。

```swift
struct Modal: View {
  @Environment(\.presentationMode) var presentationMode

  var body: some View {
    Text("Modal")
    Button("Dismiss Modal") {
      presentationMode.wrappedValue.dismiss()
    }
  }
}

struct ContentView: View {
    @State private var isModal = false

    var body: some View {
        Button("Fullscreen") {
            isModal = true
        }
        .fullScreenCover(isPresented: $isFullscreen, content: {
      Modal()
    })
}
```

Documentation - [fullScreenCover](https://developer.apple.com/documentation/swiftui/view/fullscreencover(ispresented:ondismiss:content:))

</details>


<details>
<summary id="ActionSheet">ActionSheet</summary>

操作表演示文稿的存储类型。

我们可以显示基于布尔值的 `ActionSheet`。

```swift
@State var isSheet: Bool = false

var actionSheet: ActionSheet {
    ActionSheet(title: Text("Action"),
                message: Text("Description"),
                buttons: [
                    .default(Text("OK"), action: {
                        
                    }),
                    .destructive(Text("Delete"), action: {
                        
                    })
                ]
    )
}

Button("Action Sheet") {
    self.isSheet = true
}.actionSheet(isPresented: $isSheet, content: {
    self.actionSheet
})
```

它也与可识别项绑定。

```swift
@State var sheetDetail: SheetDetail?

var body: some View {
    Button("Action Sheet") {
        self.sheetDetail = ModSheetDetail(body: "Detail")
    }.actionSheet(item: $sheetDetail, content: { detail in
        self.sheet(detail: detail.body)
    })
}

func sheet(detail: String) -> ActionSheet {
    ActionSheet(title: Text("Action"),
                message: Text(detail),
                buttons: [
                    .default(Text("OK"), action: {
                        
                    }),
                    .destructive(Text("Delete"), action: {
                        
                    })
                ]
    )
}

struct SheetDetail: Identifiable {
    var id: String {
        return body
    }
    let body: String
}
```

Documentation - [ActionSheet](https://developer.apple.com/documentation/swiftui/actionsheet)

</details>
