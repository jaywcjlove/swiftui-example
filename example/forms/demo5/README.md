启用和禁用表单中的元素
---

SwiftUI 允许我们通过使用 `disabled()` 修饰符来禁用其表单的任何部分甚至整个表单。 这采用一个布尔值，该布尔值定义是否应禁用该元素。 表单元素的样式会自动更新以反映其状态-例如，按钮和切换按钮显示为灰色。

例如，这将创建一个包含两个部分的表单：一个包含一个切换开关，一个包含一个仅在打开切换开关时才启用的按钮：

```swift
struct ContentView: View {
    @State private var agreedToTerms = false

    var body: some View {
        Form {
            Section {
                Toggle("Agree to terms and conditions", isOn: $agreedToTerms)
            }

            Section {
                Button("Continue") {
                    print("Thank you!")
                }
                .disabled(agreedToTerms == false)
            }
        }
    }
}
```

如您所见，仅通过在修饰符列表中添加 `disabled(agreedToTerms == false)` 即可禁用该按钮。

像许多其他SwiftUI修饰符一样，您可以解除 `disable()`，以便根据所需的行为在该节甚至整个表单上运行它-例如，将其移至该节之后即可。
