//
//  TextFile.swift
//  Demo
//
//  Created by 王楚江 on 2021/3/22.
//

import SwiftUI
import UniformTypeIdentifiers


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
    
    
    func write(to fileWrapper: inout FileWrapper, contentType: UTType) throws {
        let data = Data(text.utf8)
        fileWrapper = FileWrapper(regularFileWithContents: data)
    }
}
