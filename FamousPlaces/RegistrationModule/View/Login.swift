//
//  Login.swift
//  SGlobe
//
//  Created by Bhushan Tambe on 05/03/23.
//

import SwiftUI

struct Login: View {
    @State var isView = false
    var body: some View {
       NavigationStack{
           ZStack{
               Rectangle().fill(.white).ignoresSafeArea()
                   LoginTextFields()
           }
        }
    }
}



struct LoginTextFields: View {
 @State var isSecure = false
    @Environment(\.presentationMode) var presentationMode
  //  @StateObject var model = RegViewModel()
    @EnvironmentObject var model: RegViewModel
    var alert: Alert {
        Alert(title: Text(""), message: Text(model.alertMsg), dismissButton: .default(Text("OK"), action: {
            if model.alertMsg == "Account Successfully created" {
                self.presentationMode.wrappedValue.dismiss()
            }
        }))
    }
    var body: some View{
        
        VStack{
            Text("LOGIN").font(.system(size: 34, weight: .medium)).foregroundColor(.black).padding(.leading,-180).padding(.top,-90)
            //.offset(x: -120,y: -90)

                ZStack {
                    
                    Image("blueGlobe").resizable().aspectRatio(contentMode: .fit).clipShape(Circle()).frame(width: 140, height: 140).shadow(radius: 10).opacity(0.9)
    
                    Text("Smart Gl🌐be").font(.system(size: 28, weight: .bold)).foregroundColor(Color(.black)).padding(.top, 160)
                    //.offset(x: 0, y: 100)
                }.offset(x:0,y: -30)
                
                VStack(spacing: 30){
                    VStack{
                        HStack{
                            Image(systemName: "mail.fill").padding(.leading,20).foregroundColor(.black)
                            TextField("email", text: $model.emailId).padding(.leading,15).fontWeight(.bold).autocapitalization(.none)}
                        Underline()
                    }
                    VStack{
                        HStack{
                            Image(systemName: isSecure ? "eye.fill" : "eye.slash.fill").padding(.leading,20).onTapGesture {
                                isSecure.toggle()
                            }.foregroundColor(.black)
                            if isSecure{
                                TextField("password", text: $model.password).padding(.leading,15).fontWeight(.bold).autocapitalization(.none)}
                            else{
                                SecureField("password", text: $model.password).padding(.leading,15)
                            }
                        }
                        Underline()
                    }
                }
                
                Button("Login"){
                    
                    if model.isValidInputsLogin() {
                        
                        model.signIn(email: model.emailId, password: model.password)
                        model.didClose = {
                            model.showAlert = true
                            model.alertMsg = "Incorrect email or password"
                        }
                    }
                }.foregroundColor(Color.white)
                    .font(.title2)
                    .fontWeight(.bold)
                    .frame(width: 150, height: 50)
                    .background(Color(.systemBlue).opacity(0.7))
                    .cornerRadius(15).padding(.top, 25)
                    .alert(isPresented: $model.showAlert, content: {alert})
                
                HStack {
                    Text(LocalizedStringResource(stringLiteral: "dontHaveAnAccount")).font(.callout).foregroundColor(.black.opacity(0.9))
                    Text("SignUp").font(.callout).foregroundColor(Color(.tintColor)).onTapGesture {
                        model.tapSignUp.toggle()
                    }
                }.padding(.top,15)
                
            }.popover(isPresented: $model.tapSignUp, content: {
                SignUp()
            })
        }
}


struct Login_Previews: PreviewProvider {
    @ObservedObject static var model = RegViewModel()
    static var previews: some View {
        Login().environmentObject(model).environment(\.locale,.init(identifier: "en"))
    }
}
