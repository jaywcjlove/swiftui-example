//
//  TossResult.swift
//  Demo
//
//  Created by 王楚江 on 2021/3/17.
//

import SwiftUI

struct TossResult: View {
    var body: some View {
        if Bool.random() {
            Image("laser-show")
                .resizable()
                .scaledToFit()
        } else {
            Text("Better luck next time")
                .font(.title)
        }
    }
}

struct TossResult_Previews: PreviewProvider {
    static var previews: some View {
        TossResult()
    }
}
