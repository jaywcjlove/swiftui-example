如何使用 `FileDocument` 和 `DocumentGroup` 创建基于文档的应用程序？
===

SwiftUI 附带了对基于文档的应用程序的支持，这些应用程序使用户可以创建，编辑和共享文本文件之类的文档。在 `SwiftUI` 中，我们可以使用两种主要类型：`FileDocument` 协议（用于定义应用程序中的文档的外观）以及 `DocumentGroup` 结构，该结构为我们提供了一个默认场景，允许用户创建，打开和保存文档。

创建自己的基于文档的应用程序需要四个步骤：

1. 定义您的文档，包括应如何保存和加载文档。
2. 创建某种允许用户编辑其文档的视图。
3. 创建一个能够创建文件并将其加载到用户界面中的 `DocumentGroup`。
4. 更新您的 `Info.plist` 文件以表明您要使用系统的文档浏览器。

我们将从定义您的文档开始，对所有这些进行研究。某些文档类型会保存多个不同类型的文件，但是现在我们要说的是，我们仅支持纯文本，我们希望将这些文本直接读取并写入磁盘。

首先，在 `Swift` 文件的顶部添加 `import UniformTypeIdentifiers`，以便引入统一的类型标识符，这是一种固定的方式来说明文档可以使用的数据类型。

现在添加此结构，定义一个简单的文本文件：

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
        } else {
            throw CocoaError(.fileReadCorruptFile)
        }
    }

    // 当系统要将数据写入磁盘时，将调用此方法
    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        let data = Data(text.utf8)
        return FileWrapper(regularFileWithContents: data)
    }
}
```

请注意，如何在 `fileWrapper(configuration:)` 方法中将文本字符串转换为 `Data` 实例，然后使用 `FileWrapper` 保存它。 说文件应该存储在哪里不是我们的工作 – iOS会为我们负责。

我们的第二个任务是创建某种类型的编辑器区域，用户可以在其中编辑我们的文本。 这应该使用 `@Binding` 属性包装器，以便它更新 `TextFile` 结构中的文本，而不是保留其自己的本地副本：

```swift
struct ContentView: View {
    @Binding var document: TextFile

    var body: some View {
        TextEditor(text: $document.text)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(document: .constant(TextFile()))
    }
}

```

我们的第三步是编辑项目的主要 `Swift` 文件，使其包含 `DocumentGroup`，该 `DocumentGroup` 提供了用于浏览，打开和创建文件的系统标准界面：

```swift
@main
struct YourAwesomeApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: TextFile()) { file in
            ContentView(document: file.$document)
        }
    }
}
```

如您所见，它告诉 `iOS` 如何创建新文件以及如何显示它们。

最后，我们需要向 `Info.plist` 添加一个新键，因此现在打开它，右键单击某个空间，然后选择“添加行”。 对于密钥名称，输入 `Supports Document Browser`，确保“类型”设置为布尔值，然后将值设置为 `YES`。

您的基于文档的应用已准备就绪。 如果您现在重新运行应用程序，您将看到标准的 iOS 文档选择器界面，如果按 `+`，iOS 将创建一个新文件并在 `ContentView` 中打开该文件进行编辑。

如果是在 macOS 上进行保存会报错，如下报错信息

```
[OpenSavePanels] ERROR: Unable to display save panel: your app has the User Selected File Read entitlement but it needs User Selected File Read/Write to display save panels. Please ensure that your app's target capabilities include the proper entitlements.
```

这个时候需要编辑 `Demo/macOS/macOS.entitlements` 添加如下配置，到你的 `macOS.entitlements` 的配置中。

```xml
<key>com.apple.security.files.user-selected.read-write</key>
<true/>
<key>com.apple.security.files.bookmarks.app-scope</key>
<true/>
```