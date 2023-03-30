//
//  ShareLocationWithFriends.swift
//  SGlobe
//
//  Created by Bhushan Tambe on 18/03/23.
//

//import SwiftUI
//import CoreLocation
//
//struct ShareLocationWithFriends: View {
//    @Binding var lat: CLLocationDegrees
//    @Binding var long: CLLocationDegrees
//    var body: some View {
//        VStack(spacing: 50){
//            HStack(spacing: 30){
//                ButtonForImg(imgName: "whatsApp2",lat: lat,long: long)
//                ButtonForImg(imgName: "emailApp",lat: lat,long: long)
//            }.onAppear{
//                print(lat)
//                print(long)
//                print("**********")
//            }
//            HStack(spacing: 30){
//                ButtonForImg(imgName: "gmailApp",lat: lat,long: long)
//                ButtonForImg(imgName: "msgApp",lat: lat,long: long).cornerRadius(10)
//            }
//        }
//    }
//}
//
//struct ShareLocationWithFriends_Previews: PreviewProvider {
//
//    static var previews: some View {
//        ShareLocationWithFriends(lat: .constant(1),long: .constant(1))
//    }
//}
