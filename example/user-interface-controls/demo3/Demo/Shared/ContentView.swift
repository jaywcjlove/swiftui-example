//
//  ContentView.swift
//  Shared
//
//  Created by 王楚江 on 2021/3/19.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
//            NavigationLink(destination: Text("Detail view here1")) {
//                Image("logo")
//                    .renderingMode(.original)
//            }
            
            NavigationLink(destination: Text("Detail view here2")) {
                Image("logo")
//                    .frame(width: 30, height: 30, alignment: .center)
            }
            .buttonStyle(PlainButtonStyle())
            
            Button {
                // your action here
            } label: {
                Image("logo")
            }
            .buttonStyle(PlainButtonStyle())
            
//            NavigationLink(destination: Text("Detail view here3")) {
//                Image("logo")
//            }
//            .buttonStyle(PlainButtonStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
