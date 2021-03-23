//
//  ContentView.swift
//  Shared
//
//  Created by 王楚江 on 2021/3/23.
//

import SwiftUI

struct AddView: View {
    @Binding var isPresented: Bool

    var body: some View {
        Button("Dismiss") {
            isPresented = false
        }
    }
}

struct ContentView: View {
    @State private var showingAddUser = false
    var body: some View {
        VStack {
            Button("Showing Page") {
                showingAddUser = true
            }
        }
        .padding(50)
        .sheet(isPresented: $showingAddUser) {
            AddView(isPresented: $showingAddUser)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
