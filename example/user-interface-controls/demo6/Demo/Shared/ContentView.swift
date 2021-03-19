//
//  ContentView.swift
//  Shared
//
//  Created by 王楚江 on 2021/3/19.
//

import SwiftUI

struct ContentView: View {
    @State private var emailAddress = ""

    var body: some View {
        TextField("请输入邮箱地址 xx@xx.com", text: $emailAddress)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
