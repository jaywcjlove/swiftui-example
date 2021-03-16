//
//  ContentView.swift
//  Demo
//
//  Created by 王楚江 on 2021/3/17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello World")
            .padding()
            .foregroundColor(.white)
            .font(.largeTitle)
            .background(
                LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom)
            )
        Text("Hello World")
            .padding()
            .foregroundColor(.white)
            .font(.largeTitle)
            .background(
                LinearGradient(gradient: Gradient(colors: [.white, .red, .black]), startPoint: .top, endPoint: .bottom)
            )
        Text("Hello World")
            .padding()
            .foregroundColor(.white)
            .font(.largeTitle)
            .background(
                LinearGradient(gradient: Gradient(colors: [.white, .red, .black]), startPoint: .leading, endPoint: .trailing)
            )
        
        Circle()
            .fill(
                RadialGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple]), center: .center, startRadius: 50, endRadius: 200)
            )
            .frame(width: 200, height: 200)
        Circle()
            .fill(
                AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center)
            )
            .frame(width: 200, height: 200)
        Circle()
            .strokeBorder(
                AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center, startAngle: .zero, endAngle: .degrees(360)),
                lineWidth: 50
            )
            .frame(width: 200, height: 200)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
