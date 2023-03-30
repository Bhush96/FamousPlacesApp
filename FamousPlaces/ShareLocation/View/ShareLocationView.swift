//
//  ShareLocationView.swift
//  SGlobe
//
//  Created by Bhushan Tambe on 18/03/23.
//

import SwiftUI
import CoreLocation
import CoreLocationUI

struct ShareLocationView: View {
    @StateObject var locationManager = LocationManagerForSL()
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
@State var isSheetPresented = false
    @State var isAlertPresented = false
    @State var lat: CLLocationDegrees = 1
    @State var long: CLLocationDegrees = 1
       var body: some View {

               VStack {
                   
                   if let location = locationManager.location {
                       MapViewForShareLocation(lat: location.latitude, long: location.longitude)
                       HStack{
                           Text(LocalizedStringResource(stringLiteral: "Your location:"))
                           Text("\(location.latitude), \(location.longitude)")
                               .onAppear{
                                   lat = location.latitude
                                   long = location.longitude
                               }
                       }
                   }
                   HStack{
                       LocationButton{
                           locationManager.requestLocation()
                       }
                       .frame(height: 44)
                       .background(Color(.systemBlue))
                       .cornerRadius(15)
                       .foregroundColor(Color.white)
                       .padding()
                       
//                       Button{
//                           if (locationManager.location != nil){
//                               isSheetPresented = true
//                           }else{
//                               isAlertPresented = true
//                           }
//                       }label: {
//                           HStack(spacing: 4){
//                               Label("", systemImage: "location.circle.fill")
//                               Text(LocalizedStringResource(stringLiteral: "Share"))
//                                   .fontWeight(.bold)
//                           }
//                           .foregroundColor(Color.white)
//                           .padding(.all,10)
//                       } .background(Color(.systemGreen))
//                           .cornerRadius(15)
                   }
//                   .sheet(isPresented: $isSheetPresented) {
//                       ShareLocationWithFriends(lat: $lat, long: $long)
//                   }.alert(isPresented: $isAlertPresented) {
//                       Alert(title: Text(LocalizedStringResource(stringLiteral: "tapToShare")))
//                   }
                   
               }
               .navigationBarBackButtonHidden(true)
               .navigationTitle(Text(LocalizedStringResource(stringLiteral: "Current Location")))
                .navigationBarItems(leading:
                Button(action: {
                    self.mode.wrappedValue.dismiss()
                    }) {
                    Text("←").foregroundColor(Color.black).font(.largeTitle).fontWeight(.semibold)
                      })
       }
}

struct ShareLocationView_Previews: PreviewProvider {
    static var previews: some View {
        ShareLocationView()
    }
}

