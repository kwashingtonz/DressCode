//
//  LoginView.swift
//  DressCode
//
//  Created by Kalindu Washington on 2024-03-24.
//

import SwiftUI
import AlertToast

struct LoginView: View {
    
    @Binding var cartItems: [CartItemModel]
    @Binding var showLogin: Bool
    @Binding var selectedTab: Tab
    var isCheckout: Bool = false
    
    @StateObject var loginVM : LoginViewModel = LoginViewModel()
    
    @Environment(\.presentationMode)
    var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ZStack {
            Color.Default
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .overlay(alignment: .top){
                    HStack {
                        Button {
                            if isCheckout {
                                presentationMode.wrappedValue.dismiss()
                            }else{
                                showLogin.toggle()
                                selectedTab = .home
                            }
                        } label: {
                            Image("Close")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                        .frame(width: 34, height: 34)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 30)
                        .padding(.top, 10)
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
                
                
                if isCheckout{
                    
                    Button(action: {
                        self.loginVM.checkoutLogin()
                    }) {
                        Text("Login")
                            .padding()
                            .frame(maxWidth: 360, maxHeight: 40)
                            .background(Color.black)
                            .foregroundColor(.white)
                            .cornerRadius(20)
                    }
                    .padding(.top, 20)
                    
                    NavigationLink("", isActive: $loginVM.success){
                        CheckoutView(cartItems: $cartItems)
                    }
                
//                    NavigationLink{
//                        CheckoutView(cartItems: $cartItems)
//                    }label: {
//                        Text("Login")
//                            .padding()
//                            .frame(maxWidth: 360, maxHeight: 40)
//                            .background(Color.black)
//                            .foregroundColor(.white)
//                            .cornerRadius(20)
//                    }
                    
                    
                }else{
                    Button{
                        self.loginVM.homeLogin(showLogin: $showLogin, selectedTab: $selectedTab)
                    }label: {
                        Text("Login")
                            .padding()
                            .frame(maxWidth: 360, maxHeight: 40)
                            .background(Color.black)
                            .foregroundColor(.white)
                            .cornerRadius(20)
                    }
                    .padding(.top, 20)
                }
                
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
        .navigationBarBackButtonHidden(true)
        .toast(isPresenting: $loginVM.showError, duration: 2){
            AlertToast(displayMode: .banner(.pop), type: .regular, title: loginVM.errorMessage)
        }
        .toast(isPresenting: $loginVM.success, duration: 2){
            AlertToast(displayMode: .alert, type: .loading, title: "Loading")
        }
    }
        
}

#Preview {
    LoginView(cartItems: .constant(cartItms), showLogin: .constant(true), selectedTab: .constant(.home), isCheckout: true)
}
