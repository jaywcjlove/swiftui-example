如何显示地图 `Map` 视图？
===

SwiftUI 的 `Map` 使我们可以将地图嵌入到其余视图的旁边，并控制是否向用户显示，想要什么注释以及其他内容。

首先，首先创建某种状态，该状态将跟踪地图显示的坐标。 这使用了 `MKCoordinateRegion`，它以纬度/经度对为地图中心，加上一个坐标跨度来控制可见量。

例如，这将创建一个以伦敦市为中心的地图：

```swift
import MapKit

struct ContentView: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))

    var body: some View {
        Map(coordinateRegion: $region)
            .frame(width: 400, height: 300)
    }
}
```

提示：您必须导入 `MapKit` 才能获得此功能。

当用户滚动时，区域(region)状态将自动更新。

如果需要，可以通过为地图提供单独的 `interactModes` 参数来限制用户对地图的控制权。 例如，如果您希望地图始终显示完全相同的位置，则可以使用以下方法：

```swift
Map(coordinateRegion: .constant(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))), interactionModes: [])
    .frame(width: 400, height: 300)
```

或者，如果您希望用户能够放大和缩小，但不能平移到新位置，则可以使用以下方式：`[.zoom]` 用于交互方式。

最后，您可以通过为 `showsUserLocation` 和 `userTrackingMode` 提供值来要求地图显示用户的位置，甚至跟随他们的移动。

例如，这将在地图上向用户显示并始终将地图保持在其位置的中心：

```swift
struct ContentView: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))

    var body: some View {
        Map(coordinateRegion: $region, showsUserLocation: true, userTrackingMode: .constant(.follow))
            .frame(width: 400, height: 300)
    }
}
```