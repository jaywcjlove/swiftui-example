//
//  ContentView.swift
//  Demo
//
//  Created by 王楚江 on 2021/3/16.
//

import SwiftUI

struct ScaledCircle: Shape {
    // 这可控制绘图矩形内部的圆的大小。
    // 值为0时，圆圈是不可见的；
    // 值为1时，圆圈将填充矩形。
    var animatableData: CGFloat

    func path(in rect: CGRect) -> Path {
        let maximumCircleRadius = sqrt(rect.width * rect.width + rect.height * rect.height)
        let circleRadius = maximumCircleRadius * animatableData

        let x = rect.midX - circleRadius / 2
        let y = rect.midY - circleRadius / 2

        let circleRect = CGRect(x: x, y: y, width: circleRadius, height: circleRadius)

        return Circle().path(in: circleRect)
    }
}

// 可以使用任何形状剪切任何视图的常规修改器。
struct ClipShapeModifier<T: Shape>: ViewModifier {
    let shape: T

    func body(content: Content) -> some View {
        content.clipShape(shape)
    }
}

// 结合了 ScaledCircle 和 ClipShapeModifier 的自定义过渡。
extension AnyTransition {
    static var iris: AnyTransition {
        .modifier(
            active: ClipShapeModifier(shape: ScaledCircle(animatableData: 0)),
            identity: ClipShapeModifier(shape: ScaledCircle(animatableData: 1))
        )
    }
}

// 使用我们的转场显示和隐藏红色矩形的示例视图移动。
struct ContentView: View {
    @State private var isShowingRed = false

    var body: some View {
        ZStack {
            Color.blue
                .frame(width: 200, height: 200)

            if isShowingRed {
                Color.red
                    .frame(width: 200, height: 200)
                    .transition(.iris)
                    .zIndex(1)
            }
        }
        .padding(50)
        .onTapGesture {
            withAnimation(.easeInOut) {
                isShowingRed.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
