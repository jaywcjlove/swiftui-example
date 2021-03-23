如何使用 `fileExporter()` 导出文件？
---

SwiftUI 具有 `fileExporter()` 修饰符，使我们可以将应用程序中的文件导出到用户想要的任何位置 - iCloud中或其本地设备上的任何文件夹。

使用它需要几个步骤，因为您必须首先创建一个您的应用程序可以使用的文档类型。 我假设您已经做完了，所以我们可以专注于 `fileExporter()`，但是如果您还没有创建文档类型，请参阅本文的结尾–我将在此处提供示例。

首先，您需要某种状态来跟踪何时要显示或不显示导出器UI。 这是一个简单的布尔值，因此您将使用以下代码：

```swift
@State private var showingExporter = false
```

下一步是将 `fileExporter()` 修饰符添加到视图层次结构中的某个位置，传递刚刚创建的布尔状态，要导出的文档以及该文档具有的内容类型。

有用的是，`document` 参数是可选的，因此您无需始终设置此参数。 但是，为了使导出器 `UI` 出现，必须设置文档，并且状态 `Boolean` 必须为`true` – 两者都需要。

导出操作完成后，文件导出器将运行您选择的回调函数，并传入一个 `Result` 对象，该对象包含保存文件的 `URL` 或错误。

因此，您可以将这种修饰符添加到视图层次结构中：

```swift
.fileExporter(isPresented: $showingExporter, document: TextFile(), contentType: .plainText) { result in
    switch result {
    case .success(let url):
        print("Saved to \(url)")
    case .failure(let error):
        print(error.localizedDescription)
    }
}
```

注意：我将 `.plainText` 用作内容类型，但是应该与您在文档类型上设置的内容类型之一匹配。

这就是导出文件所需要的全部，但是万一您遗漏了此文件，我想提供一个示例文档类型，可以在此处使用。

首先，您需要添加一个新的导入，以便可以声明您的文档可以用作以下内容类型：

```swift
import UniformTypeIdentifiers
```

现在，您需要创建某种符合 `FileDocument` 协议的类型。 这并不需要很多，但是您确实需要告诉 `SwiftUI` 如何加载和保存文件，并为它提供一个初始化程序，该初始化程序能够根据需要创建新实例。

这是一个示例，并附有注释以解释其全部功能：


```swift
struct TextFile: FileDocument {
    // 告诉系统我们仅支持纯文本
    static var readableContentTypes = [UTType.plainText]

    // 默认情况下，您的文档为空
    var text = ""

    // 创建新的空文档的简单初始化程序
    init(initialText: String = "") {
        text = initialText
    }

    // 此初始化程序加载以前保存的数据
    init(configuration: ReadConfiguration) throws {
        if let data = configuration.file.regularFileContents {
            text = String(decoding: data, as: UTF8.self)
        }
    }

    // 当系统要将数据写入磁盘时，将调用此方法
    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        let data = Data(text.utf8)
        return FileWrapper(regularFileWithContents: data)
    }
}
```

注意：需要编辑 `Demo/macOS/macOS.entitlements` 添加如下配置，到你的 `macOS.entitlements` 的配置中，获取文件的读写权限。

```xml
<key>com.apple.security.files.user-selected.read-write</key>
<true/>
<key>com.apple.security.files.bookmarks.app-scope</key>
<true/>
```