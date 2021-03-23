//
//  ContentView.swift
//  Shared
//
//  Created by 王楚江 on 2021/3/22.
//

import SwiftUI

struct ContentView: View {
    @Binding var document: TextFile
    @State private var showingExporter: Bool = false
    var body: some View {
        VStack {
            TextEditor(text: $document.text)
        }
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button(action: {
//                    document.fileWrapper(configuration: <#T##TextFile.WriteConfiguration#>)
//                    let filePath = NSTemporaryDirectory() + "test.txt"
//                    let outputText = "Hello World!"
//                    do {
//                        try outputText.write(toFile: filePath, atomically: true, encoding: .utf8)
//                        print("测试文件已生成 \(filePath)")
//                    } catch let error {
//                        print(error)
//                    }
                    print("\($document.text.wrappedValue)")
                    self.showingExporter.toggle()
                }) {
                    Label("File Exporter", systemImage: "doc.badge.plus")
                }
            }
        }
        .fileExporter(
            isPresented: $showingExporter,
            document: TextFile(),
            contentType: .plainText,
            onCompletion: { (result) in
                self.showingExporter.toggle()
                if case .success(let url) = result {
                    print("Success  \(url)")
//                    print("--> \(NSTemporaryDirectory())")
//                    print("--3> \( url.relativeString)")
//                    let filePath = NSURL.fileURL(withPath: "\(url)")
//                    let outputText = "Hello World!"// "H: \($document.text.wrappedValue)"
                 } else {
                     print("Failure")
                 }
            }
        )

        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(document: .constant(TextFile()))
    }
}
