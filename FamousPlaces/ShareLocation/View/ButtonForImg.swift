//
//  ButtonForImg.swift
//  FamousPlaces
//
//  Created by Bhushan Tambe on 30/03/23.
//

//import SwiftUI
//import CoreLocation
//
//struct ButtonForImg: View {
//    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
//    @State var imgName: String
//    @StateObject var locationManager = LocationManagerForSL()
//    @State var isLocation = false
//    @State var lat: CLLocationDegrees?
//    @State var long: CLLocationDegrees?
//    var body: some View {
//        Button{
//            isLocation = true
//           // mode.wrappedValue.dismiss()
//        }label: {
//            Image(imgName).resizable().scaledToFit().frame(width: 100, height: 100)
//        }.alert(isPresented: $isLocation) {
//            Alert(title:
//                    Text("\(NSLocale(localeIdentifier: "shareLocationWithF"))" + "\(lat ?? 0)" + ", " + "\(long ?? 0)")
//                , primaryButton: .default(Text("Ok"), action: {
//                mode.wrappedValue.dismiss()
//            }), secondaryButton: .cancel())
//        }
//    }
//}
//
//struct ButtonForImg_Previews: PreviewProvider {
//    static var previews: some View {
//        ButtonForImg(imgName: "gmailApp")
//    }
//}
