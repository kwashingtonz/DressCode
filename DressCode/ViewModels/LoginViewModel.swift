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
    
    func homeLogin(showLogin: Binding<Bool>, selectedTab: Binding<Tab>){
        if username.isEmpty || password.isEmpty {
            showError = true
            errorMessage = "Please enter username and password"
        }else{
            
            guard let url = URL(string: "http://localhost:4000/service/login/login") else {
                self.showError = true
                self.errorMessage = "Invalid UR"
                print("Invalid URL")
                return
            }

            let credentials = ["username": username, "password": password]
            let jsonData = try? JSONSerialization.data(withJSONObject: credentials)
            
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = jsonData
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data else {
                    self.showError = true
                    self.errorMessage = "No data received"
                    print("No data received: \(error?.localizedDescription ?? "Unknown error")")
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let loginResponse = try decoder.decode(CommonResponse.self, from: data)
                    
                    if loginResponse.status {
                        DispatchQueue.main.async {
                            self.success = true
                            showLogin.wrappedValue.toggle()
                            selectedTab.wrappedValue = .home
                        }
                    } else {
                        self.showError = true
                        self.errorMessage = "Invalid username or password"
                    }
                } catch {
                    self.showError = true
                    self.errorMessage = "Error decoding response"
                    print("Error decoding response: \(error.localizedDescription)")
                }
            }.resume()

        }
    }
    
    func checkoutLogin(){
        if username.isEmpty || password.isEmpty {
            showError = true
            errorMessage = "Please enter username and password"
        }else{
            
            guard let url = URL(string: "http://localhost:4000/service/login/login") else {
                self.showError = true
                self.errorMessage = "Invalid UR"
                print("Invalid URL")
                return
            }

            let credentials = ["username": username, "password": password]
            let jsonData = try? JSONSerialization.data(withJSONObject: credentials)
            
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = jsonData
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data else {
                    self.showError = true
                    self.errorMessage = "No data received"
                    print("No data received: \(error?.localizedDescription ?? "Unknown error")")
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let loginResponse = try decoder.decode(CommonResponse.self, from: data)
                    
                    if loginResponse.status {
                        DispatchQueue.main.async {
                            self.success = true
                        }
                    } else {
                        self.showError = true
                        self.errorMessage = "Invalid username or password"
                    }
                } catch {
                    self.showError = true
                    self.errorMessage = "Error decoding response"
                    print("Error decoding response: \(error.localizedDescription)")
                }
            }.resume()

        }
    }

}
