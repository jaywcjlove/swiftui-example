//
//  ContentView.swift
//  Shared
//
//  Created by 王楚江 on 2021/4/7.
//

import SwiftUI
import LocalAuthentication

struct ContentView: View {
    @State private var isUnlocked = false

    var body: some View {
        VStack {
            if self.isUnlocked {
                Text("Unlocked")
            } else {
                Text("Locked")
            }
        }
        .onAppear(perform: authenticate)
    }
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        // 检查是否可以进行生物特征认证
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            // 有可能，所以继续使用它
            let reason = "We need to unlock your data."
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                // 身份验证现已完成
                DispatchQueue.main.async {
                    if success {
                        self.isUnlocked = true
                        print("成功认证")
                    } else {
                        self.isUnlocked = false
                        print("有个问题")
                    }
                }
            }
        } else {
            print("没有生物识别")
            // 没有生物识别
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
