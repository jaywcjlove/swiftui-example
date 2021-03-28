//
//  PostNoSelectionPlaceholder.swift
//  Demo
//
//  Created by 王楚江 on 2021/3/29.
//

import SwiftUI

struct PostNoSelectionPlaceholder: View {
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            Text("No post selected")
                .font(.headline)
                .fontWeight(.bold)
            Image(systemName: "bolt.slash")
                .resizable()
                .frame(width: 20, height: 20)
        }
        .frame(minWidth: 200, maxWidth: 260)
//        .frame(minWidth: 200,
//               maxWidth: .infinity,
//               maxHeight: .infinity)
    }
}

struct PostNoSelectionPlaceholder_Previews: PreviewProvider {
    static var previews: some View {
        PostNoSelectionPlaceholder()
    }
}
