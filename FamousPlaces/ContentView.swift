//
//  ContentView.swift
//  FamousPlaces
//
//  Created by Bhushan Tambe on 30/03/23.
//

import SwiftUI


struct ContentView: View {
    @Binding var lang: String
    @EnvironmentObject var viewModel: RegViewModel
    var body: some View {

        VStack{

            if viewModel.isSignedin{
                LandingScreen(lang: $lang).transition(.move(edge: .trailing))
            }else{
                Login().transition(.move(edge: .leading))
            LandingScreen(lang: .constant("hi"))
            }

        }.environment(\.locale, .init(identifier: lang))
        .onAppear{
            viewModel.signedIn = viewModel.isSignedin
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    @ObservedObject static var viewModel = RegViewModel()
    static var previews: some View {
        ContentView(lang: .constant("en")).environmentObject(viewModel)
    }
}
