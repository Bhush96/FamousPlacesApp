//
//  MapViewModel.swift
//  SGlobe
//
//  Created by Bhushan Tambe on 08/03/23.
//

import SwiftUI
import CoreLocation
import GoogleMaps
import Foundation

let locationManager = CLLocationManager()
class Coordinator: NSObject, CLLocationManagerDelegate, ObservableObject{
    var pass: LocalizedStringResource = ""

    var lastKnownLocation: CLLocationCoordinate2D?
    init(_ pass: LocalizedStringResource){
        self.pass = pass
    }
    
    func addMarkers(mapView: GMSMapView){
        let marker = GMSMarker()
        for sN in stateWithCoordinates{
            if sN.stateName == self.pass.key{
                marker.position = sN.coordinates
                marker.title = sN.stateName
                marker.snippet = sN.stateName
                marker.map = mapView
            }
        }
    }
    

}


struct MapView: UIViewRepresentable{
  
    @Binding var zoomInOut: Float
    @Binding var pass: LocalizedStringResource
    @State var lat: CLLocationDegrees = 22
    @State var long: CLLocationDegrees = 78
  
      typealias UIViewType = GMSMapView
   
        func makeUIView(context: Context) -> GMSMapView {
            var camera = GMSCameraPosition(latitude: lat, longitude: long, zoom: zoomInOut)
            var mapView = GMSMapView.map(withFrame: .zero, camera: camera)
          
            for sc in stateWithCoordinates{
                if sc.stateName == pass.key {
                    camera = GMSCameraPosition(latitude: sc.coordinates.latitude, longitude: sc.coordinates.longitude, zoom: zoomInOut)
                    mapView = GMSMapView.map(withFrame: .zero, camera: camera)
                    print(pass.key)
                }
            }
       
            return mapView
        }
         
    
        func updateUIView(_ uiView: GMSMapView, context: Context) {
            uiView.animate(toZoom: zoomInOut)
            context.coordinator.addMarkers(mapView: uiView)
        }
        
        func makeCoordinator() -> Coordinator {
            return Coordinator(pass)
        }
    
  
}
