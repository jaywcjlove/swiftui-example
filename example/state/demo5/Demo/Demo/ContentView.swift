//
//  ContentView.swift
//  Demo
//
//  Created by 王楚江 on 2021/3/16.
//

import SwiftUI

// 创建一个可观察的对象类，它宣布
// 更改为其唯一属性
class UserAuthentication: ObservableObject {
    var username = "Taylor" {
        willSet {
            objectWillChange.send()
        }
    }
}

struct ContentView: View {
    @StateObject var user = UserAuthentication()
    var body: some View {
        VStack(alignment: .leading) {
            TextField("Enter your name", text: $user.username)
            Text("Your username is: \(user.username)")
        }
        .padding(100)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
