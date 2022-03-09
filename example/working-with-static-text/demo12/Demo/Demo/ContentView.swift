//
//  ContentView.swift
//  Demo
//
//  Created by 王楚江 on 2022/3/9.
//

import SwiftUI
import MarkdownUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 50) {
          Text("You can't touch this")

          Text("Break it down!")
              .textSelection(.enabled)
        }
        VStack(spacing: 50) {
          Text("You can't touch this")
          Text("Break it down!")
        }
        .textSelection(.enabled)
        List(0..<100) { index in
          Text("Row \(index)")
        }
        .textSelection(.enabled)
        Markdown(
          #"""
          # Heading 1
          A paragraph of text.
          ## Heading 2
          A paragraph of text.
          ### Heading 3
          A paragraph of text.
          #### Heading 4
          A paragraph of text.
          ##### Heading 5
          A paragraph of text.
          ###### Heading 6
          A paragraph of text.
          
          ## Overview
          
          SwiftUI provides views, controls, and layout structures
          for declaring your app’s user interface.
          
          ```swift
          Group {
              Text("SwiftUI")
              Text("Combine")
              Text("Swift System")
          }
          .font(.headline)
          ```
          
          ---
          
          - From Apple Developer Documentation
          - From Apple Developer Documentation
          
          """#,
          baseURL: URL(string: "https://github.com/gonzalezreal/MarkdownUI/raw/main/")
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
