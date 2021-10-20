//
//  ContentView.swift
//  Demo2
//
//  Created by 王楚江 on 2021/10/20.
//

import SwiftUI

struct ContentView: View {
    let sites = ["Apple.com", "wangchujiang.com", "Swift.org"]

    var body: some View {
        NavigationView {
            List(sites, id: \.self) { site in
                NavigationLink(site) {
                    SourceViewer(site: site)
                }
            }
            .navigationTitle("View Source")
        }
    }
}

struct SourceViewer: View {
    let site: String
    @State private var sourceCode = "Loading…"

    var body: some View {
        if #available(iOS 15.0, *) {
            ScrollView {
                Text(sourceCode)
                    .font(.system(.body, design: .monospaced))
            }
            .task {
                guard let url = URL(string: "https://\(site)") else {
                    return
                }
                
                do {
                    let (data, _) = try await URLSession.shared.data(from: url)
                    sourceCode = String(decoding: data, as: UTF8.self).trimmingCharacters(in: .whitespacesAndNewlines)
                } catch {
                    sourceCode = "Failed to fetch site."
                }
            }
        } else {
            EmptyView()
            // Fallback on earlier versions
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
