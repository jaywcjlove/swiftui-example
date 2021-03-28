//
//  ContentView.swift
//  Shared
//
//  Created by 王楚江 on 2021/3/26.
//

import SwiftUI

struct Details: View {
    let name: String?
    var body: some View {
        Text(" \(name ?? "")")
            .padding(.vertical, 2.0)
    }
}

struct ContentSplitView: View {
    let name: String?
    var body: some View {
        Text(" Content \(name ?? "")")
            .frame(minWidth: 300, maxWidth: .infinity)
            .toolbar {
                Text("Detail")
                Button(action: toggleSidebar) {
                    Image(systemName: "square.righthalf.fill")
                        .imageScale(.medium)
                }
                .buttonStyle(BorderedButtonStyle())
                Button(action: toggleSidebar) {
                    Image(systemName: "square.righthalf.fill")
                        .imageScale(.medium)
                }
                
            }
    }
    private func toggleSidebar() {
        #if os(macOS)
        NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
        #endif
    }
}

struct ContentView: View {
    @State private var users = ["Paul", "Taylor", "Adele"]
    @State var select: String? = "Paul"
    
    var body: some View {
        NavigationView {
            List {
                ForEach(users.indices, id: \.self) { index in
                    NavigationLink(
                        destination: ContentSplitView(name: users[index]),
                        tag: users[index],
                        selection: $select
                    ) {
                        Details(name: users[index])
                    }
                }
            }
            ProgressView()
            PostNoSelectionPlaceholder()
//                .frame(minWidth: 200, maxWidth: .infinity)
                .frame(minWidth: 200, maxWidth: 260)
//                .frame(minWidth: 100,
//                       maxWidth: 210,
//                       maxHeight: .infinity)
                .toolbar {
                    ToolbarItemGroup {
                        Text("Title")
                        Spacer()
                        Button(action: {}) {
                            Image(systemName: "square.righthalf.fill")
                                .imageScale(.medium)
                        }
                    }
                }
        }
        .frame(minWidth: 800, minHeight: 400)
        .onAppear {
            print("ttt")
            #if os(macOS)
            NSApp.keyWindow?.toolbar?.insertItem(withItemIdentifier: .toggleSidebar, at: 0)
            #endif
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
