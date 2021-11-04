从 UIKit 迁移到 SwiftUI
===

![Updated for Xcode 13](https://img.shields.io/static/v1?label=&message=Updated%20for%20Xcode%2013.1&color=blue&logo=Xcode&logoColor=white)
![New in macOS 12](https://img.shields.io/static/v1?label=&message=New%20in%20macOS%2012&color=lightgrey&logo=apple)

如果你以前使用过 UIKit，你所知道和喜爱的许多类，只要去掉 `UI` 的前缀，就可以直接映射到它们的SwiftUI 等价物。这并不意味着它们在本质上是一样的，只是它们有相同或相似的功能。

这里有一个列表可以让你开始，UIKit 类的名字后面是 SwiftUI 的名字：

* `UITableView`: `List`
* `UICollectionView`: `LazyVGrid` and `LazyHGrid`
* `UILabel`: `Text`
* `UITextField`: `TextField`
* `UITextField` with `isSecureTextEntry` set to true: `SecureField`
* `UITextView`: `TextEditor` (plain strings only)
* `UISwitch`: `Toggle`
* `UISlider`: `Slider`
* `UIButton`: `Button`
* `UINavigationController`: `NavigationView`
* `UIAlertController` with style `.alert`: `Alert`
* `UIAlertController` with style `.actionSheet`: `ActionSheet`
* `UIStackView` with horizontal axis: `HStack`
* `UIStackView` with vertical axis: `VStack`
* `UIImageView`: `Image`
* `UISegmentedControl`: `Picker`
* `UIStepper`: `Stepper`
* `UIDatePicker`: `DatePicker`
* `UIProgressView`: `ProgressView` with a value
* `UIActivityIndicatorView`: `ProgressView` without a value
* `NSAttributedString`: Incompatible with SwiftUI; use `Text` instead.

还有许多其他的组件是 SwiftUI 独有的，比如说堆栈视图（stack view），它让我们可以按深度而不是按水平或垂直方向来构建东西。
