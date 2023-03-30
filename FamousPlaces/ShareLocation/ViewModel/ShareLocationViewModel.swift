//
//  ShareLocationViewModel.swift
//  SGlobe
//
//  Created by Bhushan Tambe on 18/03/23.
//

import GoogleMaps
import CoreLocation
import SwiftUI

class LocationManagerForSL: NSObject, ObservableObject, CLLocationManagerDelegate {
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
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Swift.Error) {
        //location = locations.first?.coordinate
    }
}

struct MapViewForShareLocation: UIViewRepresentable{
   
    @StateObject var locationManager = LocationManagerForSL()
    typealias UIViewType = GMSMapView
    @State var lat: CLLocationDegrees 
    @State var long: CLLocationDegrees
    func makeUIView(context: Context) -> GMSMapView {
        let camera = GMSCameraPosition(latitude: lat, longitude: long, zoom: 8)
        let mapview = GMSMapView(frame: .zero, camera: camera)
//        camera = GMSCameraPosition(latitude: locationManager.location?.latitude ?? 22, longitude: locationManager.location?.latitude ?? 78, zoom: 8)
//        mapview = GMSMapView(frame: .zero, camera: camera)
        return mapview
    }
    
    func updateUIView(_ uiView: GMSMapView, context: Context) {
        context.coordinator
    }
    func makeCoordinator() -> () {
        return Coordinator()
    }
}
