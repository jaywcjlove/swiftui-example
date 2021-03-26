//
//  ContentView.swift
//  Shared
//
//  Created by 王楚江 on 2021/3/26.
//

import SwiftUI

struct ContentView: View {
    @State private var users = ["Paul", "Taylor", "Adele"]
    @State var select: String? = "Paul"
    var body: some View {
        NavigationView {
            List {
                ForEach(users.indices, id: \.self) { index in
                    NavigationLink(destination: Text(users[index]), tag: users[index], selection: $select) {
                        Text(users[index])
                            .padding(.vertical, 2.0)
                    }
                }
            }
        }
        .toolbar {
            Text("this is not the title")
            Button(action: toggleSidebar) {
                Label("Upload", systemImage: "square.righthalf.fill")
            }
        }
        .listStyle(SidebarListStyle())
    }
    private func toggleSidebar() {
        #if os(macOS)
        NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
        #endif
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
