//
//  ContentView.swift
//  Demo
//
//  Created by 王楚江 on 2021/3/16.
//

import SwiftUI

struct DismissingView1: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        Button("Dismiss Me 1") {
            presentationMode.wrappedValue.dismiss()
        }
    }
}

struct DismissingView2: View {
    @Binding var isPresented: Bool
    var body: some View {
        Button("Dismiss Me 2") {
            isPresented = false
        }
    }
}

struct ContentView: View {
    @State private var showingDetail = false
    @State private var showingDetail2 = false
    var body: some View {
        Button("Show Detail 1") {
            showingDetail = true
        }
        .sheet(isPresented: $showingDetail) {
            DismissingView1()
        }
        .padding(100)

        Button("Show Detail 2") {
            showingDetail2 = true
        }
        .sheet(isPresented: $showingDetail2) {
            DismissingView2(isPresented: $showingDetail2)
        }
        .padding(100)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
