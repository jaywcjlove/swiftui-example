//
//  ContentView.swift
//  Shared
//
//  Created by 王楚江 on 2021/3/22.
//

import SwiftUI

struct ContentView: View {
    @Binding var document: TextFile

    var body: some View {
        VStack() {
            TextEditor(text: $document.text)
                .frame(maxWidth: .infinity)
//                .frame(height: NSScreen.main.bounds.height)
                .foregroundColor(.white)
                .background(Color(#colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)))
                .zIndex(2)
            
            Spacer()
        }
        .background(Color(#colorLiteral(red: 0.7856134772, green: 0.8419756293, blue: 0.9575102925, alpha: 1)))
        .edgesIgnoringSafeArea(.all)
        .navigationTitle("Redactor")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(document: .constant(TextFile()))
    }
}
