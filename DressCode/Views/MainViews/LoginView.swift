//
//  LoginView.swift
//  DressCode
//
//  Created by Kalindu Washington on 2024-03-24.
//

import SwiftUI

struct LoginView: View {
    
    var loginAction: ButtonAction
    @StateObject var loginVM : LoginViewModel = LoginViewModel()
    
    var body: some View {
        ZStack {
            Color.Default
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .overlay(alignment: .top){
                    HStack {
                        Button {
                            loginAction()
                        } label: {
                            Image("Close")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                        .frame(width: 34, height: 34)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 30)
                        .padding(.top, -25)
                    }
                }
            VStack {
                Image("Logo")
                
                TextField("Username", text: $loginVM.username)
                    .autocapitalization(.none)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .font(tenorSans(20))
                    
                SecureField("Password", text: $loginVM.password)
                    .autocapitalization(.none)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .font(tenorSans(20))
                
                Button{
//                    self.loginVM.validateUser()
                   loginAction()
                }label: {
                    Text("Login")
                        .padding()
                        .frame(maxWidth: 360, maxHeight: 40)
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                }
                .padding(.top, 20)
                
                Button{
                    
                }label: {
                    Text("Not a member? Sign up")
                        .foregroundColor(.black)
                        .font(tenorSans(20))
                }
                .padding(.top, 40)
            }
            .padding(.bottom, 100)
                
        }
    }
}

#Preview {
    LoginView(loginAction: {})
}
