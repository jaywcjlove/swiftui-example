//
//  ContentView.swift
//  Demo
//
//  Created by 王楚江 on 2021/3/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            // 只显示日期
            Text(Date().addingTimeInterval(600), style: .date)

            // 只显示时间
            Text(Date().addingTimeInterval(600), style: .time)

            // 显示从现在开始的相对距离，并自动更新
            Text(Date().addingTimeInterval(600), style: .relative)

            // 制作计时器样式，自动更新
            Text(Date().addingTimeInterval(600), style: .timer)
        }
        .frame(width: 500, height: 300, alignment: .center)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
