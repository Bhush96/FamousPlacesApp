//
//  FamousPlacesApp.swift
//  FamousPlaces
//
//  Created by Bhushan Tambe on 30/03/23.
//

import SwiftUI
import GoogleMaps
import Firebase


@main
struct FamousPlacesApp: App {
    @State(initialValue: "en") var lang: String
    init(){

        FirebaseApp.configure()
        GMSServices.provideAPIKey("YOUR API KEY")
        GMSServices.setMetalRendererEnabled(true)
    }
  
    var body: some Scene {
        WindowGroup {
            let viewModel = RegViewModel()
            ContentView(lang: $lang)
                .environmentObject(viewModel)
                .environment(\.locale, .init(identifier: lang))
        }
    }
}
