如何更改 macOS 应用中主菜单？
---

在 `macOS` 上，主菜单使用可用的命令菜单和组来组织其主菜单项。每个菜单都表示为顶层菜单栏菜单，并且每个命令组在一个顶层菜单中都有一组对应的菜单项，这些菜单项由分隔符菜单项分隔。

在 `iPadOS` 上，带有键盘快捷键的命令在快捷键可发现性 HUD 中公开，用户按住 `Command(⌘)` 键时可以看到它们。

```swift
@main
struct passwordApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .commands {
            CommandGroup(replacing: .help) {
                Button(action: {
                  print("Menu Button selected")
                }, label: {
                  Text("Menu Button")
                })
                Divider()
                Button(action: {}) {
                    Text("MyApp Help")
                }
            }
            CommandMenu("Edit") {
					
				    }
        }
    }
}
```

菜单项通常最好用分隔符分开，这可以通过在 `SwiftUI` 中添加 `Divider()` 来完成。

## 编辑现有菜单

已经介绍了创建新菜单，但是如何将新项目添加到现有菜单呢？

在这种情况下，请使用 `CommandGroup` 而不是 `CommandMenu`。 不同之处在于，您无需为菜单设置标题，而是给它提供了一个放置选项，并引用了现有的标准菜单项。

```swift
CommandGroup(after:, addition:)
CommandGroup(before:, addition:)
CommandGroup(replacing:, addition:)
CommandGroup(replacing: .appInfo) {}
```

在每种情况下，第一个参数都是 `CommandGroupPlacement`，它指定有限范围的标准菜单项中的一个。

## 删除标准菜单项

如果您真的想摆脱默认菜单项（或项目组）之一，则可以使用 `CommandGroupPlacement` 并将现有的菜单项替换为 `EmptyView()`。 就人机界面指南而言，这可能不是一个好主意，但是如果需要的话，它是一个选择。

```swift
CommandGroup(replacing: CommandGroupPlacement.appVisibility) {
	EmptyView()
}
```

如果您希望能够以更自定义的方式响应它，也可以用自己的版本替换现有的菜单项。 我可以想象对“帮助”菜单项执行此操作，因为我不喜欢使用Apple的“帮助”系统，而是希望将用户定向到其他地方。

## 使用单独的文件

如果要添加许多菜单，则可能开始感觉到您的 `DemoApp.swift` 文件有点拥挤。 您可以将这些菜单命令分成一个或多个单独的文件，只要它们包含在符合 `Commands` 协议且主体也符合 `Commands` 的结构中即可。

```swift
struct MenuCommands: Commands {
	@Binding var toggleSetting: Bool

	var body: some Commands {
		CommandMenu("Custom Menu") {
			Button(action: {
				print("Menu Button selected")
			}, label: {
				Text("Menu Button")
			})

			Divider()

			Toggle(isOn: $toggleSetting, label: {
				Text("Toggle")
			})
		}
	}
}
```

该结构不能拥有自己的数据，否则您会收到很多警告，但可以从其父级绑定到数据。 就像在 `Apple` 预设中一样，在命令修饰符中插入对此结构以及您创建的任何其他结构的调用。

```swift
@main
struct DemoApp: App {
    @State private var toggleSetting = true
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .commands {
            MenuCommands(toggleSetting: $toggleSetting)
        }
    }
}
```

## Bonus: Credits

每个Mac应用程序都有一个 `关于...` 菜单项，该菜单项会弹出一个简单的对话框，其中包含基本的应用程序信息：图标，应用程序名称和版本号。 这些将始终出现，但是有一种简单的方法可以在此信息下添加更多信息，并且可以包括格式化的文本和链接。

创建一个名为 `Credits.rtf` 的新文件 - `New` => `File` 对话框具有 `Rich Text File` 选项。具有此确切名称的文件中的任何内容都将在 `About` 框中的标准信息下方显示。

Xcode的RTF编辑器虽然不是很好，但是已经足够了。 文本编辑器上方有一些基本的格式设置工具，但您也可以右键单击文本以获取更多选项，包括“字体”和“颜色”面板。

要插入网络链接，请转到 `Editor` 菜单，然后选择 `Add Link...`。