//
//  ContentView.swift
//  Shared
//
//  Created by 王楚江 on 2021/3/20.
//

import SwiftUI

struct ContentView: View {
    @State private var agreedToTerms = false

    var body: some View {
        Form {
            Section {
                Toggle("Agree to terms and conditions", isOn: $agreedToTerms)
            }

            Section {
                Button("Continue") {
                    print("Thank you!")
                }
                .disabled(agreedToTerms == false)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
