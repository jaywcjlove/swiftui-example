//
//  ContentView.swift
//  Shared
//
//  Created by 王楚江 on 2021/3/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [
            NSSortDescriptor(keyPath: \ProgrammingLanguage.name, ascending: true),
            NSSortDescriptor(keyPath: \ProgrammingLanguage.creator, ascending: true)
        ],
        animation: .default)
    private var items: FetchedResults<ProgrammingLanguage>

    var body: some View {
        List {
            ForEach(items.indices, id: \.self) { index in
                HStack {
                    Text("\(index) Creator: \(items[index].creator ?? "Anonymous")")
                    Button("Del Item", action: {
                        removeLanguages(at: [index])
                        print("test \(index)")
                    })
                }
            }
            .onDelete(perform: removeLanguages)
        }
        .toolbar {
            #if os(iOS)
            EditButton()
            #endif

            Button(action: addItem) {
                Label("Add Item", systemImage: "plus")
            }
        }
    }

    private func removeLanguages(at offsets: IndexSet) {
        for index in offsets {
            let language = items[index]
            viewContext.delete(language)
        }
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    private func addItem() {
        withAnimation {
            let language = ProgrammingLanguage(context: viewContext)
            language.name = "Python"
            language.creator = "Guido van Rossum"

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
