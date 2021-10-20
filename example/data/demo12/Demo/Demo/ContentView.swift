//
//  ContentView.swift
//  Demo
//
//  Created by 王楚江 on 2021/10/21.
//

import SwiftUI
import CoreLocation
import CoreLocationUI

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()

    @Published var location: CLLocationCoordinate2D?

    override init() {
        super.init()
        manager.delegate = self
    }

    func requestLocation() {
        manager.requestLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
    }
}

struct ContentView: View {
    @StateObject var locationManager = LocationManager()

    var body: some View {
        VStack {
            if let location = locationManager.location {
                Text("Your location: \(location.latitude), \(location.longitude)")
            }

            if #available(iOS 15.0, *) {
                LocationButton {
                    locationManager.requestLocation()
                }
                .frame(height: 44)
                .padding()
                LocationButton(.shareMyCurrentLocation) {
                    locationManager.requestLocation()
                }
                .frame(height: 44)
                .padding()
            } else {
                // Fallback on earlier versions
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
