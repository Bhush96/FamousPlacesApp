//
//  LandingScreen.swift
//  SGlobe
//
//  Created by Bhushan Tambe on 05/03/23.
//

import SwiftUI
import FirebaseAuth
import UIKit

struct LandingScreen: View {
    @State var borderEffectError = 0
    @Binding var lang: String
    @State var isOn = false
    @Environment(\.managedObjectContext) private var moc
    @EnvironmentObject var viewModel: RegViewModel
    @State var selection: Int? = 0
    @State var isAlert = false
    var body: some View {
        NavigationStack {
            ZStack{
                Rectangle().fill(.white).ignoresSafeArea()
                
                VStack(spacing: 30){
                    ZStack{
                        RoundedRectangle(cornerRadius: 10).fill(Color(hue: 0.762, saturation: 0.817, brightness: 0.445)).frame(width: UIScreen.main.bounds.width - 30, height: UIScreen.main.bounds.height * 0.17)
                        
                        Text(LocalizedStringResource(stringLiteral: "Welcome")).font(.title).fontWeight(.bold).foregroundColor(.white).padding(.leading,-170).padding(.top,-60)
                        Text(LocalizedStringResource(stringLiteral: "allInOne")).font(.title3).foregroundColor(.white).padding(.leading, -160).padding(.top,-10)
                        HStack{

                            Spacer()
                            Image("whiteGlobe").resizable().frame(width: 140, height: 140).clipShape(Circle())
                        }
                        .frame(width: UIScreen.main.bounds.width - 40, height: UIScreen.main.bounds.height * 0.2)
                    }.padding(.top,-130)
                                HStack(spacing: 30){
                                    NavigationLink {
                                        CountryView()
                                    } label: {
                                        VStack(spacing: 6){
                                            ZStack{
                                                Rectangle().fill(Color.white)
                                                    .frame(width: UIScreen.main.bounds.width * 0.35,height: UIScreen.main.bounds.width * 0.35)
                                                    .cornerRadius(10)
                                                    .shadow(radius: 6)
                                                VStack{
                                                    Image(systemName: "globe").resizable().frame(width: 30, height: 30).foregroundColor(Color(hue: 0.462, saturation: 0.717, brightness: 0.445))
                                                    Text(LocalizedStringResource(stringLiteral: "countryList")).foregroundColor(.black)
                                                }
                                            }
                                        }
                                    }
                        
                                }
                                HStack(spacing: 30){
                                    
                                    NavigationLink {
                                        ShareLocationView()
                                    } label: {
                                        VStack(spacing: 6){
                                            ZStack{
                                                Rectangle().fill(Color.white)
                                                    .frame(width: UIScreen.main.bounds.width * 0.35,height: UIScreen.main.bounds.width * 0.35)
                                                    .cornerRadius(10)
                                                    .shadow(radius: 6)
                                                VStack{
                                                    Image(systemName: "location.square.fill").resizable().frame(width: 30, height: 30).foregroundColor(Color.green)
                                                    Text(LocalizedStringResource(stringLiteral: "Current Location")).foregroundColor(.black)
                                                }
                                            }
                                        }
                                    }
                                }
                   .alert(Text(LocalizedStringResource(stringLiteral: "doYouWantToLogout")), isPresented: $isAlert) {
                        Button(role: .destructive, action: viewModel.signOut){
                            Text(LocalizedStringResource(stringLiteral: "Ok"))
                        }
                    }
                }
            
            }
            .safeAreaInset(edge: .top) {
               
                HStack {
                    toggleBody
                    Spacer()
                    Text("Smart Gl🌐be").font(.title).fontWeight(.bold).foregroundColor(Color.white)
                    Spacer()
                    Text("⏻").fontWeight(.bold).frame(width:30,height: 30).foregroundColor(Color.white).background(Color.black).cornerRadius(16).padding(.trailing,10).padding(.bottom,-15)
                        .onTapGesture {
                            self.isAlert = true
                        }
                }.frame(maxWidth: .infinity).frame(height: 60).background(Color(.systemRed).opacity(0.9))
            }
        }.navigationBarBackButtonHidden(true)
    }
    
    var toggleBody: some View{
        Button{
            isOn.toggle()
            if isOn{
                lang = "hi"
            }else{
                lang = "en"
            }
        }label: {
            Text(isOn ? "अ" : "E")
                .frame(width: 20, height: 20)
                .padding(5)
                .foregroundColor(.black)
                .background(isOn ? Color.green : Color.white.opacity(0.8))
                .cornerRadius(5)
                .padding(.leading,20)
                .padding(.bottom,-15)
        }
    }
}


struct LandingScreen_Previews: PreviewProvider {
    static let vm = RegViewModel()
    static var previews: some View {
        LandingScreen(lang: .constant("en")).environmentObject(vm)
    }
}
