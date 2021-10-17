表单选择器 `Pickers`
===

SwiftUI 的选择器视图在表单中时会表现出特殊的行为，并会根据您使用它们的平台自动进行调整。 在 `iOS` 上，这种行为尤其令人印象深刻，因为选择器可以折叠为一个列表行，该行可以导航到可能选项的新列表–这是使用许多选项的一种非常自然的方式。

例如，这将创建一个带有选择器的表单，该选择器使用一个数组作为其项目：

```swift
struct ContentView: View {
    @State private var selectedStrength = "Mild"
    let strengths = ["Mild", "Medium", "Mature"]

    var body: some View {
        Form {
            Section {
                Picker("Strength", selection: $selectedStrength) {
                    ForEach(strengths, id: \.self) {
                        Text($0)
                    }
                }
            }
        }
    }
}
```

在 `iOS` 上，该列表将显示为一个列表行，您可以点击以进入一个新屏幕，显示所有可能的选项 - `Mild`，`Medium` 和 `Mature`。 您当前的选择旁边将有一个选中标记，当您选择一个新选项时，它将返回到上一个屏幕，现在显示该屏幕。

提示：由于表单中的选择器具有这种导航行为，因此重要的是，将它们显示在iOS的 `NavigationView` 中，否则您将发现点击它们不起作用。 这可能是您直接在表单周围创建的，也可以是从本身包装在 `NavigationView` 中的另一个视图中呈现表单的。

如果要禁用此行为，可以通过使用 `.pickerStyle(WheelPickerStyle())` 修饰符强制选择器采用其常规样式，如下所示：


```swift
struct ContentView: View {
    @State private var selectedStrength = "Mild"
    let strengths = ["Mild", "Medium", "Mature"]

    var body: some View {
        NavigationView {
            Form {
                Section {
                    #if !os(macOS)
                    Picker("Strength", selection: $selectedStrength) {
                        ForEach(strengths, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    #else
                    Picker("Strength", selection: $selectedStrength) {
                        ForEach(strengths, id: \.self) {
                            Text($0)
                        }
                    }
                    #endif
                }
            }
            .navigationTitle("Select your cheese")
        }
    }
}
```