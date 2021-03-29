//
//  ContentView.swift
//  Shared
//
//  Created by 王楚江 on 2021/3/29.
//

import SwiftUI

struct ContentView: View {
   var body: some View {
      GeometryReader{geometry in
         HSplitView(){
            Rectangle()
                .frame(minWidth: 0, idealWidth: 200, maxWidth: .infinity)
            HSplitView(){
                Rectangle().layoutPriority(1)
                Rectangle().foregroundColor(.green).frame(minWidth:200, idealWidth: 200, maxWidth: .infinity)
            }.layoutPriority(1)
         }
         .frame(width: geometry.size.width, height: geometry.size.height)
      }
   }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
