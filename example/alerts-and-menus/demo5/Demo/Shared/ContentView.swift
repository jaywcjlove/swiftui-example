//
//  ContentView.swift
//  Shared
//
//  Created by 王楚江 on 2021/3/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showingSheet = false

    var body: some View {
        Button("Show Action Sheet") {
            showingSheet = true
        }
        .actionSheet(isPresented: $showingSheet) {
            #if os(iOS)
            return ActionSheet(
                title: Text("What do you want to do?"),
                message: Text("There's only one choice..."),
                buttons: [.default(Text("Dismiss Action Sheet"))]
            )
            #endif
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
