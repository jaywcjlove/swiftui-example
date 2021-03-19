//
//  ContentView.swift
//  Shared
//
//  Created by 王楚江 on 2021/3/19.
//

import SwiftUI

struct ContentView: View {
    @State private var showDetails = false

    var body: some View {
        VStack(alignment: .leading) {
            Button("Show details") {
                showDetails.toggle()
            }

            if showDetails {
                Text("You should follow me on Twitter: @twostraws")
                    .font(.largeTitle)
            }
            
            Button {
                print("Image tapped!")
            } label: {
                Image("sunset")
                    .frame(width: 6, height: 6, alignment: .center)
            }
            
            Button {
                print("Button pressed")
            } label: {
                Text("Press Me")
                    .padding(20)
            }
            .contentShape(Rectangle())
        }
        .frame(width: 460, height: 300, alignment: .leading)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
