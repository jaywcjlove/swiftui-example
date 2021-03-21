//
//  Persistence.swift
//  Shared
//
//  Created by 王楚江 on 2021/3/21.
//

import CoreData


struct Persistence {
    // 一个单例供我们的整个应用程序使用
    static let shared = Persistence()

    // 存储核心数据
    let container: NSPersistentContainer

    // SwiftUI预览的测试配置
    static var preview: Persistence = {
        let controller = Persistence(inMemory: true)

        let viewContext = controller.container.viewContext
        // 创建10种示例编程语言。
        for _ in 0..<10 {
            let language = ProgrammingLanguage(context: viewContext)
            language.name = "Example Language 1"
            language.creator = "A. Programmer"
        }
        
        
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }

        return controller
    }()
    
    func save() {
        let context = container.viewContext

        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                // Show some error here
            }
        }
    }

    // 用于加载 Core Data 的初始化程序，可以选择使用内存中的存储区。
    init(inMemory: Bool = false) {
        // 如果您没有为模型 Main 命名，则需要在下面更改此名称。
        container = NSPersistentContainer(name: "Main")

        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }

        container.loadPersistentStores { description, error in
            if let error = error {
                // 用代码替换此实现，以适当地处理错误。
                // fatalError() 使应用程序生成崩溃日志并终止。 尽管此功能在开发过程中可能很有用，但您不应在运输应用程序中使用此功能。

                /*
                出现错误的典型原因包括：
                * 父目录不存在，无法创建或不允许写入。
                * 由于设备被锁定时的权限或数据保护，无法访问持久性存储。
                * 设备空间不足。
                * 无法将 store could 迁移到当前模型版本。
                检查错误消息，以确定实际的问题是什么。
                */
                fatalError("Error: \(error.localizedDescription)")
            }
        }
    }
}
