如何使用 `SpriteView` 集成 `SpriteKit`？
---

SwiftUI 的 `SpriteView` 使我们可以在 SwiftUI 内部渲染任何 `SKScene` 子类，如果您需要的话，它甚至可以调整场景的大小。

要尝试，请首先将导入 `SpriteKit` 添加到您的 Swift 文件中。 其次，创建您要渲染的某种游戏场景。 例如，这将在您轻按的任何位置创建下降框，添加物理效果，使它们整齐地交互：

```swift
// 一个带有掉落盒子的简单游戏场景
class GameScene: SKScene {
    override func didMove(to view: SKView) {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
    }
    // 只能在 iOS 中运行
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let box = SKSpriteNode(color: SKColor.red, size: CGSize(width: 50, height: 50))
        box.position = location
        box.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 50, height: 50))
        addChild(box)
    }
}

// 一个示例 SwiftUI 创建一个 GameScene 并调整其大小
// 在 300x400 点
struct ContentView: View {
    var scene: SKScene {
        let scene = GameScene()
        scene.size = CGSize(width: 300, height: 400)
        scene.scaleMode = .fill
        return scene
    }

    var body: some View {
        SpriteView(scene: scene)
            .frame(width: 300, height: 400)
            .ignoresSafeArea()
    }
}
```

您创建的游戏场景是完全交互式的，因此它的工作方式就像普通的 `SKView` 在 `UIKit` 中所做的一样。