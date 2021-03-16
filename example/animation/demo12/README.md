如何设置文字大小的动画？
----

SwiftUI没有内置的动画文本大小的方法，但是我们可以创建一个 `AnimatableModifier` 来实现这种效果。 这与使用简单的 `scaleEffect()` 修饰符不同，后者会导致您的文本在放大时变得模糊，而此自定义动画将正确地重新渲染您的文本，因此在所有大小下都看起来不错。

这需要几个步骤：

1. 创建一个 `AnimatableModifier` 来接受名称和大小，并将 `size` 属性用于其可设置动画的数据。
2. 将其包装在 `View` 扩展中，使其更易于使用。
3. 在 `SwiftUI` 视图中进行尝试。

这是完整的代码示例：

```swift
// 通过各种大小为字体设置动画效果的修改器。
struct AnimatableCustomFontModifier: AnimatableModifier {
    var name: String
    var size: CGFloat

    var animatableData: CGFloat {
        get { size }
        set { size = newValue }
    }

    func body(content: Content) -> some View {
        content
            .font(.custom(name, size: size))
    }
}

// 为了使其更易于使用，我建议将其包装在 `View` 扩展中，如下所示：
extension View {
    func animatableFont(name: String, size: CGFloat) -> some View {
        self.modifier(AnimatableCustomFontModifier(name: name, size: size))
    }
}

// 一个示例View试用
struct ContentView: View {
    @State private var fontSize: CGFloat = 32

    var body: some View {
        Text("Hello, World!")
            .animatableFont(name: "Georgia", size: fontSize)
            .onTapGesture {
                withAnimation(Animation.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 1).repeatForever()) {
                    fontSize = 72
                }
            }
    }
}
```

而已！ 要进行尝试，请创建一个 `@State` 属性以存储您的字体大小，然后将其传递给 `animatableFont()`。

如果您想使用 `Apple` 的系统字体，最好的方法是使用单独的 `AnimatableModifier`。 这样，如果字体发生更改，您可以确保UI保持更新。

外观如下：

```swift
struct AnimatableSystemFontModifier: AnimatableModifier {
    var size: CGFloat
    var weight: Font.Weight
    var design: Font.Design

    var animatableData: CGFloat {
        get { size }
        set { size = newValue }
    }

    func body(content: Content) -> some View {
        content
            .font(.system(size: size, weight: weight, design: design))
    }
}

extension View {
    func animatableSystemFont(size: CGFloat, weight: Font.Weight = .regular, design: Font.Design = .default) -> some View {
        self.modifier(AnimatableSystemFontModifier(size: size, weight: weight, design: design))
    }
}

struct ContentView: View {
    @State private var fontSize: CGFloat = 32

    var body: some View {
        Text("Hello, World!")
            .animatableSystemFont(size: fontSize)
            .onTapGesture {
                withAnimation(Animation.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 1).repeatForever()) {
                    fontSize = 72
                }
            }
    }
}

```

我首先在 Apple [示例代码](https://developer.apple.com/documentation/swiftui/fruta_building_a_feature-rich_app_with_swiftui) 中看到了这种技术。