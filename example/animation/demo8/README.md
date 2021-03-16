如何使用 matchedGeometryEffect() 将动画从一个视图同步到另一个视图？
----

如果同一视图出现在视图层次结构的两个不同部分中，并且希望在它们之间进行动画处理（例如，从列表视图转到缩放的详细视图），则应使用 `SwiftUI` 的 `matchedGeometryEffect()` 修饰符，这有点 例如 `Keynote` 中的 `Magic Move`。

要使用修饰符，请将其附加到在层次结构的不同部分中相同的一对视图。 完成此操作后，当您在两种视图状态之间切换时，您会发现 `SwiftUI` 可以平滑地对同步视图进行动画处理。

要进行尝试，请首先创建某种布局，其中视图将出现在两个位置。 在此示例中，我有一个红色圆圈，然后在一个视图状态下有一些文本，但是在另一视图状态下，该圆圈在文本之后并更改了颜色：

```swift
struct ContentView: View {
    @State private var isFlipped = false

    var body: some View {
        VStack {
            if isFlipped {
                Circle()
                    .fill(Color.red)
                    .frame(width: 44, height: 44)
                Text("Taylor Swift – 1989")
                    .font(.headline)
            } else {
                Text("Taylor Swift – 1989")
                    .font(.headline)
                Circle()
                    .fill(Color.blue)
                    .frame(width: 44, height: 44)
            }
        }
        .onTapGesture {
            withAnimation {
                isFlipped.toggle()
            }
        }
    }
}
```

如果运行该命令，您会看到 `SwiftUI` 淡入和淡出视图以创建过渡-可以，但是我们可以做得更好。

首先，您需要使用 `@Namespace` 属性包装器为您的视图创建一个全局名称空间。 实际上，这不是视图上的属性，而是在幕后使我们可以将视图附加在一起。

因此，您可以添加如下所示的属性：`@Namespace private var animation`。

接下来，您需要向要使用同步效果进行动画处理的所有视图中添加 `.matchedGeometryEffect(id：YourIdentifierHere，in：animation)`。 `YourIdentifierHere` 部分应替换为您的配对中每个部分共享的唯一编号。

在我们的示例中，我们可以将其用于圈子：

```swift
.matchedGeometryEffect(id: "Shape", in: animation)
```

并将其用作文本：

```swift
.matchedGeometryEffect(id: "AlbumTitle", in: animation)
```

就是这样–再次运行该示例时，您将看到两个视图平滑移动。

最终代码如下：

```swift
struct ContentView: View {
    @Namespace private var animation
    @State private var isFlipped = false

    var body: some View {
        VStack {
            if isFlipped {
                Circle()
                    .fill(Color.red)
                    .frame(width: 44, height: 44)
                    .matchedGeometryEffect(id: "Shape", in: animation)
                Text("Taylor Swift – 1989")
                    .matchedGeometryEffect(id: "AlbumTitle", in: animation)
                    .font(.headline)
            } else {
                Text("Taylor Swift – 1989")
                    .matchedGeometryEffect(id: "AlbumTitle", in: animation)
                    .font(.headline)
                Circle()
                    .fill(Color.blue)
                    .frame(width: 44, height: 44)
                    .matchedGeometryEffect(id: "Shape", in: animation)
            }
        }
        .onTapGesture {
            withAnimation {
                isFlipped.toggle()
            }
        }
    }
}
```

对于更高级的示例，请尝试以下操作–它借鉴了 `Apple Music` 的专辑显示风格，在点击时将小视图扩展为更大的视图。 在此示例中，仅文本是动画的，因为其位置在改变： 

```swift
struct ContentView: View {
    @Namespace private var animation
    @State private var isZoomed = false

    var frame: CGFloat {
        isZoomed ? 300 : 44
    }

    var body: some View {
        VStack {
            Spacer()

            VStack {
                HStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.blue)
                        .frame(width: frame, height: frame)
                        .padding(.top, isZoomed ? 20 : 0)

                    if isZoomed == false {
                        Text("Taylor Swift – 1989")
                            .matchedGeometryEffect(id: "AlbumTitle", in: animation)
                            .font(.headline)
                        Spacer()
                    }
                }

                if isZoomed == true {
                    Text("Taylor Swift – 1989")
                        .matchedGeometryEffect(id: "AlbumTitle", in: animation)
                        .font(.headline)
                        .padding(.bottom, 60)
                    Spacer()
                }
            }
            .onTapGesture {
                withAnimation(.spring()) {
                    isZoomed.toggle()
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .frame(height: 400)
            .background(Color(white: 0.9))
            .foregroundColor(.black)
        }
    }
}
```