如何使用 `keyboardShortcut()` 添加键盘快捷键？
---

通过 `SwiftUI`，可以轻松地为所有支持它的设备（例如iPadOS和macOS）添加键盘快捷键，而这些快捷键都可以使用 `keyboardShortcut()` 修饰符。

您可以通过三种方式使用此修饰符，因此从最基本的角度开始：将键附加到现有操作。 例如，如果我们有一个登录按钮，并且想在用户按下 `Cmd + L` 时触发其行为，我们可以这样做：

```swift
Button("Log in") {
    print("Authenticating…")
}
.keyboardShortcut("l")
```

请注意，我们不需要指定 `Cmd + L` ，因为除非另行指定，否则 `SwiftUI` 会假定使用 `Command` 键。 如果您在 iPad 上运行该代码示例，将会看到按住 `Cmd` 键会弹出键盘快捷键叠加层，已经显示 “Cmd + L Login” – SwiftUI 会自动弄清楚我们的按钮做了什么并使它可用。

使用 `keyboardShortcut()` 的第二种方法是指定您实际需要的修饰键。 例如，这将创建另外两个按钮，一个按钮使用 `Shift + R` 触发 `Run` 按钮，另一个按钮使用 `Ctrl + Opt + Cmd + H` 触发 `Home` 按钮：

```swift
VStack {
    Button("Run") {
        print("Running…")
    }
    .keyboardShortcut("r", modifiers: .shift)

    Button("Home") {
        print("Going home")
    }
    .keyboardShortcut("h", modifiers: [.control, .option, .command])
}
```

这说明了如何选择一个自定义修饰符，以及如何同时选择多个修饰符。

使用 `keyboardShortcut()` 的第三种也是最后一种方法是使用其内置键之一，这对于难以键入的键（例如 `Escape` 和 `Arrow`）以及语义键（例如取消操作和默认操作）很有用。 语义键确实非常有用-每次您按回车键接受警报的默认操作，或者每次按 `Escape` 键取消操作时，您都在使用语义键。

因此，这将创建一个具有默认操作快捷方式的按钮，这意味着按 Return 键将触发该按钮：