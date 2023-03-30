//
//  SignUp.swift
//  SGlobe
//
//  Created by Bhushan Tambe on 05/03/23.
//

import SwiftUI

struct SignUp: View {
  
    @EnvironmentObject var viewModel: RegViewModel
    var body: some View {
       
        ZStack {
            Rectangle().fill(.white).ignoresSafeArea()
            SignUpTextFields(model: _viewModel).environmentObject(viewModel)
        }
    }
}

struct SignUp_Previews: PreviewProvider {
    static let vm = RegViewModel()
    static var previews: some View {
        SignUp().environmentObject(vm)
    }
}

struct SignUpTextFields: View{

    @EnvironmentObject var model: RegViewModel
    @State var isSecure = false
    @State var isSecureC = false
    @Environment(\.presentationMode) var presentationMode
    var alert: Alert {
        Alert(title: Text(""), message: Text(model.alertMsg), dismissButton: .default(Text("OK"), action: {
            if model.alertMsg == "Account Successfully created" {
                self.presentationMode.wrappedValue.dismiss()
            }
        }))
    }
    var body: some View{
        VStack{
            Text("Sign Up").font(.largeTitle).bold().padding().foregroundColor(.black).padding(.leading, -180).padding(.top, -100)
            
            VStack(spacing: 30){
                VStack{
                    HStack{
                        Image(systemName: "person.fill").padding(.leading,15)
                        TextField("firstName", text: $model.firstName).padding(.leading,15)}
                    Underline()}
                VStack{
                    HStack{
                        Image(systemName: "person.fill").padding(.leading,15)
                        TextField("lastName", text: $model.lastName).padding(.leading,15)}
                    Underline()}
                VStack{
                    HStack{
                            Image(systemName: "mail.fill").padding(.leading,15)
                        TextField("email", text: $model.emailIdSignUp).padding(.leading,15)}
                    Underline()}
                VStack{
                    HStack{
                        Image(systemName: isSecure ? "eye.fill" : "eye.slash.fill").padding(.leading,15).onTapGesture {
                            isSecure.toggle()
                        }
                        if isSecure{
                            TextField("password", text: $model.passwordSignUp).padding(.leading,15)}
                        else{
                            SecureField("password", text: $model.passwordSignUp).padding(.leading,15)
                        }
                    }
                    Underline()}
                VStack{
                    HStack{
                        Image(systemName: isSecureC ? "eye.fill" : "eye.slash.fill").padding(.leading,15).onTapGesture {
                            isSecureC.toggle()
                        }
                        if isSecureC{
                            TextField("confirmPassword", text: $model.confirmPassword).padding(.leading,15)}
                        else{
                            SecureField("confirmPassword", text: $model.confirmPassword).padding(.leading,15)
                        }}
                    Underline()}
            }
            Button{
                if self.isValidInputsSignUp() {
                    
                    model.signUp(email: model.emailIdSignUp, password: model.passwordSignUp, confirmPass: model.confirmPassword)
                    model.didClose = {
                        debugPrint(model.emailId)
                        model.showAlert = true
                        model.alertMsg = "Account Successfully created"
                    }
                }
            }label: {
                Text("Sign Up")
                .font(.title3)
                    .frame(width: 150, height: 45)
                    .background(Color.green.opacity(0.7))
                    .cornerRadius(15)
                    .padding(.top,15)
            }   .alert(isPresented: $model.showAlert, content: {self.alert})
                .buttonStyle(PlainButtonStyle())
            if !model.signUpErrorMessage.isEmpty {
                Text("\(model.signUpErrorMessage)")
                    .padding(.top,10)
                    .font(.footnote)
                    .foregroundColor(.red)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                            model.signUpErrorMessage = ""
                        }
                    }
            }
            HStack {
                Text("Already have an account?").font(.callout).foregroundColor(.black)
                Text("Login")
                    .foregroundColor(Color(.tintColor))
                    .font(.callout)
                    .onTapGesture {
                        self.presentationMode.wrappedValue.dismiss()
                    }
            }.padding(.top,15)
            
        }
    }
    //MARK: -SignUp Validation
    fileprivate func isValidInputsSignUp() -> Bool {
        if model.emailIdSignUp == "" {
            model.alertMsg = "Email can't be blank."
            model.showAlert.toggle()
            return false
        } else if !model.emailIdSignUp.isValidEmail {
            model.alertMsg = "Email is not valid."
            model.showAlert.toggle()
            return false
        }  else if model.passwordSignUp == "" {
            model.alertMsg = "Password can't be blank."
            model.showAlert.toggle()
            return false
        } else if !(model.passwordSignUp.isValidPassword) {
            model.alertMsg = "Please enter valid password"
            model.showAlert.toggle()
            return false
        } else if model.confirmPassword == "" {
            model.alertMsg = "Confirm password can't be blank."
            model.showAlert.toggle()
            return false
        } else if model.passwordSignUp != model.confirmPassword {
            model.alertMsg = "Password and confirm password does not match."
            model.showAlert.toggle()
            return false
        } else if model.firstName == "" || model.lastName == "" {
            model.alertMsg = "Name can't be blank."
            model.showAlert.toggle()
            return false
        }
        
        return true
    }
}

