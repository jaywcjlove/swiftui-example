//
//  ContentView.swift
//  Shared
//
//  Created by 王楚江 on 2021/3/18.
//

import SwiftUI

struct SampleRow: View {
    let id: Int

    var body: some View {
        Text("Row \(id)")
    }

    init(id: Int) {
        print("Loading row \(id)")
        self.id = id
    }
}

struct ContentView: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(1...100, id: \.self, content: SampleRow.init)
            }
        }
        .frame(height: 300)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
