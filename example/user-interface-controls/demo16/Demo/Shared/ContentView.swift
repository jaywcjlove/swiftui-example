//
//  ContentView.swift
//  Shared
//
//  Created by 王楚江 on 2021/3/19.
//

import SwiftUI

struct ContentView: View {
    @State private var age = 18
    @State private var age2 = 18

    var body: some View {
        VStack {
            Stepper("Enter your age", value: $age, in: 0...130)
            Text("Your age is \(age)")
            Stepper("Enter your age", onIncrement: {
                age2 += 1
            }, onDecrement: {
                age2 -= 1
            })

            Text("Your age is \(age2)")
        }
        .frame(width: 300, height: 360, alignment: .center)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
