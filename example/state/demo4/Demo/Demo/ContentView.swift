//
//  ContentView.swift
//  Demo
//
//  Created by 王楚江 on 2021/3/16.
//

import SwiftUI

// 我们的可观察对象类
class GameSettings: ObservableObject {
    @Published var score = 0
}

// 期望找到 GameSettings 对象的视图
// 在环境中，并显示其得分。
struct ScoreView: View {
    @EnvironmentObject var settings: GameSettings

    var body: some View {
        Text("Score: \(settings.score)")
    }
}

struct ContentView: View {
    @StateObject var settings = GameSettings()
    var body: some View {
        NavigationView {
            VStack {
                // 写入 environment settings 的按钮
                Button("Increase Score") {
                    settings.score += 1
                }

                NavigationLink(destination: ScoreView()) {
                    Text("Show Detail View")
                }
            }
            .frame(height: 200)
        }
        .environmentObject(settings)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
