//
//  GoogleMapsView.swift
//  SGlobe
//
//  Created by Bhushan Tambe on 05/03/23.
//

import SwiftUI
import GoogleMaps
import CoreLocation


struct GoogleMapsView: View {

    @Binding var pass: LocalizedStringResource
    @State var zoomInOut: Float = 7
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var body: some View {
   
            ZStack{
                VStack{
                    MapView(zoomInOut: $zoomInOut, pass: $pass).ignoresSafeArea(.all,edges: .top)
                }

                VStack(spacing: 10){
                    Button{
                        if zoomInOut >= 2.0 {
                            zoomInOut = zoomInOut + 1
                        }
                       print(zoomInOut)
                    }label:{
                        Image(systemName: "plus").resizable().frame(width: 13,height: 13).fontWeight(.heavy)
                    }
                    Rectangle().frame(width: 20, height: 1).opacity(0.3)
                    Button{
                        if zoomInOut >= 3.0 {
                            zoomInOut = zoomInOut - 1
                        }
                        print(zoomInOut)
                    }label:{
                        Image(systemName: "minus").resizable().frame(width: 13,height: 3).fontWeight(.heavy).padding(.all,2)
                    }
                }.frame(width: 32,height: 60).background(Color.white).foregroundColor(Color(.darkGray)).clipShape(RoundedRectangle(cornerRadius: 10))
                    .offset(x: 165,y: 320)
                
            }
            .safeAreaInset(edge: .top) {
                HStack {
                    Button(action: {
                        self.mode.wrappedValue.dismiss()
                        }) {
                            Text("←").foregroundColor(Color.white).font(.largeTitle).fontWeight(.semibold).padding(.leading,10)
                          }
                    Spacer()
                    Text(LocalizedStringResource(stringLiteral: pass.key)).font(.title2).fontWeight(.bold).foregroundColor(Color.white).padding(.trailing, 50)
                    Spacer()
                }.frame(maxWidth: .infinity).frame(height: 50).background(Color(.systemRed).opacity(0.9))
            }
            .navigationBarBackButtonHidden(true)
    }

}


struct TabViewGM: View{
    @Binding var pass: LocalizedStringResource
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var body: some View{
        TabView{
            GoogleMapsView(pass: .constant(pass))
                .tabItem {
                    Label("Google Maps", systemImage: "mappin.and.ellipse")
                }
            
            famousBody
            .tabItem {
                Label("Famous Places", systemImage: "house.and.flag.fill")
            }
        }.navigationBarBackButtonHidden(true)
    }
    var famousBody: some View{
        VStack{
            HStack{
                Text("Famous Places")
                Text("(")
                Text(LocalizedStringResource(stringLiteral: pass.key))
                Text(")")
            }.font(.title2).fontWeight(.bold).frame(maxWidth: .infinity).padding(10).background(Color.red).foregroundColor(.white)
            List{
                ForEach(stateWithCoordinates){ sc in
                    if sc.stateName == pass.key{
                        ForEach(sc.famousPlaces, id: \.key){ fp in
                            Text(fp)
                        }
                    }
                }
            }
        }.listStyle(InsetListStyle())
    }
}
struct GoogleMapView2_Previews: PreviewProvider {
    static var statesAndCo: StatesAndCoordinates = StatesAndCoordinates(id: 0, stateName: "", coordinates: CLLocationCoordinate2D(latitude: 1, longitude: 1))
    static var previews: some View {
        TabViewGM(pass: .constant("s"))
    }
}
