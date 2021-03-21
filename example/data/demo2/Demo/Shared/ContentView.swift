//
//  ContentView.swift
//  Shared
//
//  Created by 王楚江 on 2021/3/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \ProgrammingLanguage.name, ascending: true)],
        animation: .default)
    private var items: FetchedResults<ProgrammingLanguage>

    var body: some View {
        NavigationView {
            List {
                ForEach(items) { item in
                    if (item.name != nil) {
                        Text("Item at \(item.name!)")
                    }
                }
            }
            .toolbar {
                Button(action: addItem) {
                    Label("Add Item", systemImage: "plus")
                }
            }
            
        }
    }
    
    private func addItem() {
        let newItem = ProgrammingLanguage(context: viewContext)
        newItem.name = "Example Language 1"
        newItem.creator = "A. Programmer"
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, Persistence.preview.container.viewContext)
    }
}
