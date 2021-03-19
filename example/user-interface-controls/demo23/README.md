如何在地图 `Map` 视图中显示注释？
---

SwiftUI 的 `Map` 视图使我们能够在地图顶部显示注释视图，包括默认标记和图钉，以及完全自定义的视图。

这需要三个步骤：

1. 使用 `MKCoordinateRegion` 跟踪地图的中心和缩放级别，以创建某种状态来跟踪地图显示的坐标。
2. 准备一个位置数组以用于注释。
3. 确定您希望它们在地图上显示的方式。 您可以显示内置的 `MapPin` 和 `MapMarker` 批注，也可以使用自己的视图。

无论您拥有什么位置，您所使用的类型都必须符合 `Identifiable`，因此 `SwiftUI` 可以理解如何唯一地标识每个项目。 例如，您可能会使用以下内容：

```swift
struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}
```

如果您只有 `CLLocationCoordinate2D` 数据，则可以通过添加以下扩展名直接使用它们：

```swift
extension CLLocationCoordinate2D: Identifiable {
    public var id: String {
        "\(latitude)-\(longitude)"
    }
}
```

无论如何，这是一个将所有内容放在一起的示例，因此您可以看到各个省会城市的地图图钉：

```swift
struct City: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

struct ContentView: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10))

    let annotations = [
        City(name: "London", coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275)),
        City(name: "Paris", coordinate: CLLocationCoordinate2D(latitude: 48.8567, longitude: 2.3508)),
        City(name: "Rome", coordinate: CLLocationCoordinate2D(latitude: 41.9, longitude: 12.5)),
        City(name: "Washington DC", coordinate: CLLocationCoordinate2D(latitude: 38.895111, longitude: -77.036667))
    ]

    var body: some View {
        Map(coordinateRegion: $region, annotationItems: annotations) {
            MapPin(coordinate: $0.coordinate)
        }
        .frame(width: 400, height: 300)
    }
}
```

它使用了 `iOS` 多年的传统图钉样式，但是如果您想要更大的图钉样式，则可以改用 `MapMarker`，如下所示： `MapMarker(coordinate: $0.coordinate)`

而且，如果要完全控制，还可以传递完全自定义的视图-一些文本，图像，`NavigationLink` 等。

例如，我们可以在我们的首都绘制一个四点画的圆圈，如下所示：

```swift
MapAnnotation(coordinate: $0.coordinate) {
    Circle()
        .strokeBorder(Color.red, lineWidth: 4)
        .frame(width: 40, height: 40)
}
```