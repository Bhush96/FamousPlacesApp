//
//  RegViewModel.swift
//  SGlobe
//
//  Created by Bhushan Tambe on 05/03/23.
//

import Foundation
import FirebaseAuth
import SwiftUI

class RegViewModel: ObservableObject {
    
    //MARK: Login
    @Published var emailId: String = ""
    @Published var password: String = ""
    @Published var tapSignUp: Bool = false
    
    //MARK: SignUp
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var emailIdSignUp = ""
    @Published var passwordSignUp = ""
    @Published var confirmPassword = ""
    
    //MARK: Firebase properties
    @Published var signUpProcessing = false
    @Published var signUpErrorMessage = ""
    let auth = Auth.auth()
    var didClose : () ->  Void = {}
    @Published var signedIn = false
    @Published var checkUserStatus = false
    var isSignedin: Bool{
       return auth.currentUser != nil
   }
    @Published var showAlert = false
    @Published var alertMsg = ""

    func signIn(email: String, password: String){

            auth.signIn(withEmail: email, password: password){ [weak self] result, error in

                guard result != nil, error  == nil else {
                    self?.didClose()
                    debugPrint("Failed")
                    return
                }
                //Success
                debugPrint("Success")
                DispatchQueue.main.async {
                    withAnimation{
                        self?.signedIn = true
                    }
                }
            }
        }
    
   
   func signUp(email: String, password: String, confirmPass: String){

       signUpProcessing = true
           auth.createUser(withEmail: email, password: password){[weak self] result, error in

                   guard result != nil, error  == nil else {
                       self!.signUpProcessing = false
                       self!.signUpErrorMessage = error!.localizedDescription
                       debugPrint(self!.signUpErrorMessage)
                       return
                   }
                   //Success
                   debugPrint(result!)
                   self?.didClose()

                   switch result {
                   case .none:
                       debugPrint("Could not create account.")
                       self!.signUpProcessing = false
                   case .some(_):
                       debugPrint("User created")
                       self!.signUpProcessing = false

           }
       }
   }

    func signOut() {
        withAnimation{
            try? auth.signOut()
            self.signedIn = false}
    }

    func currentUser() -> String {
        let user = Auth.auth().currentUser
        return (user?.email!)!
    }

    
    func isValidInputsLogin() -> Bool {
       if self.emailId == "" {
           self.alertMsg = "Email can't be blank."
           self.showAlert.toggle()
           return false
       } else if !self.emailId.isValidEmail {
           self.alertMsg = "Email is not valid."
           self.showAlert.toggle()
           return false
       }  else if self.password == "" {
           self.alertMsg = "Password can't be blank."
           self.showAlert.toggle()
           return false
       } else if !(self.password.isValidPassword) {
           self.alertMsg = "Please enter valid password"
           self.showAlert.toggle()
           return false
       }
       
       return true
   }
    
}
