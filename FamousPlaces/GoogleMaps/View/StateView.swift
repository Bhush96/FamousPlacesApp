//
//  StateView.swift
//  SGlobe
//
//  Created by Bhushan Tambe on 06/03/23.
//

import SwiftUI
import CoreLocation

struct StateView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var country: Country
    var statesAndCo: StatesAndCoordinates = StatesAndCoordinates(id: 0, stateName: "", coordinates: CLLocationCoordinate2D(latitude: 1, longitude: 1))
    @State var pass: String = ""
    var body: some View {
        VStack {
          
                List{
                    ForEach(country.id.words.sorted{$0.self > $1.self},id: \.self){ i in
                        ForEach(countryListWithStates[Int(i)].states_C, id: \.key){ state in
                            NavigationLink(destination: TabViewGM(pass: .constant(state))){
                                Text(state)
                        }
                    }
                }
            }.safeAreaInset(edge: .top) {
                HStack {
                    Button(action: {
                        self.mode.wrappedValue.dismiss()
                        }) {
                            Text("←").foregroundColor(Color.white).font(.largeTitle).fontWeight(.semibold).padding(.leading,10)
                          }
                    Spacer()
                    Text(LocalizedStringResource(stringLiteral: "stateList")).font(.title2).fontWeight(.bold).foregroundColor(Color.white).padding(.trailing, 50)
                    Spacer()
                }.frame(maxWidth: .infinity).frame(height: 50).background(Color(.systemRed).opacity(0.9))
            }
            }.navigationBarBackButtonHidden(true)
            
    }
}

struct StateView_Previews: PreviewProvider {
    static var previews: some View {
        StateView(country: Country(id: 0, countryName: "Country", states_C: ["da"]))
    }
}

