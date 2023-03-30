//
//  CountryAndStateView.swift
//  SGlobe
//
//  Created by Bhushan Tambe on 06/03/23.
//

import SwiftUI

struct CountryView: View {

    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var countryList: [Country] = countryListWithStates
    var body: some View {
        NavigationView {
         
                List{
                    ForEach(countryList,id: \.id){country in
                        NavigationLink(destination: StateView(country: country)){
                            Text(country.countryName)
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
                    Text(LocalizedStringResource(stringLiteral: "countryList")).font(.title2).fontWeight(.bold).foregroundColor(Color.white).padding(.trailing, 50)
                    Spacer()
                }.frame(maxWidth: .infinity).frame(height: 50).background(Color(.systemRed).opacity(0.9))
            }
        }
        .navigationBarBackButtonHidden(true)
           
    }
}

struct CountryAndStateView_Previews: PreviewProvider {
    static var previews: some View {
        CountryView()
    }
}
