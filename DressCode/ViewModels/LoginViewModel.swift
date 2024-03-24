//
//  LoginViewModel.swift
//  DressCode
//
//  Created by Kalindu Washington on 2024-03-24.
//

import Foundation
import SwiftUI

class LoginViewModel : ObservableObject {
    
    @Published var username : String = ""
    @Published var password : String = ""
    @Published var showError : Bool = false
    @Published var errorMessage : String = ""
    @Published var success : Bool = false
    
    func validateUser(){
        if username.isEmpty || password.isEmpty {
            showError = true
            errorMessage = "Please enter username and password to continue"
        }else if username == "abc" && password == "123"{
            showError = false
            success = true
        }else{
            showError = true
            errorMessage = "Wrong username or password. Please try again"
        }
    }
    
}
