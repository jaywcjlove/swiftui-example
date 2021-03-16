如何画一个棋盘？
----

SwiftUI 的路径不必是连续的，孤立的形状，而可以是多个矩形，椭圆形等等，它们可以组合成一个整体。

作为演示此问题的简便方法，我们可以编写一个形状，通过构建一系列具有一定数量的行和列的矩形来创建棋盘格图案，如下所示：

```swift
struct Checkerboard: Shape {
    let rows: Int
    let columns: Int

    func path(in rect: CGRect) -> Path {
        var path = Path()

        // figure out how big each row/column needs to be
        let rowSize = rect.height / CGFloat(rows)
        let columnSize = rect.width / CGFloat(columns)

        // loop over all rows and columns, making alternating squares colored    
        for row in 0 ..< rows {
            for column in 0 ..< columns {
                if (row + column).isMultiple(of: 2) {
                    // this square should be colored; add a rectangle here
                    let startX = columnSize * CGFloat(column)
                    let startY = rowSize * CGFloat(row)

                    let rect = CGRect(x: startX, y: startY, width: columnSize, height: rowSize)
                    path.addRect(rect)
                }
            }
        }

        return path
    }
}

// Create a checkerboard in a view
struct ContentView: View {
    var body: some View {
        Checkerboard(rows: 16, columns: 16)
            .fill(Color.red)
            .frame(width: 200, height: 200)    
    }
}
```