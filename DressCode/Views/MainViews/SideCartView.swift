//
//  SideCartView.swift
//  DressCode
//
//  Created by Kalindu Washington on 2024-03-24.
//

import SwiftUI

import SwiftUI

struct SideCartViewTemp: View {
    @State var presentSideMenu = true
    @State var cartItems: [CartItemModel] = cartItms
    
    var body: some View {
        ZStack {
            SideCartMenu()
        }.background(.black)
    }
    
    @ViewBuilder
    private func SideCartMenu() -> some View {
        SideView(isShowing: $presentSideMenu, content: AnyView(SideCartViewContents(presentSideMenu: $presentSideMenu, cartItems: $cartItems)), direction: .trailing)
    }
    
}

#Preview {
    SideCartViewTemp()
}

struct SideCartViewContents: View {
    @Binding var presentSideMenu: Bool
    @Binding var cartItems: [CartItemModel]
    @State private var totalPrice: Int = 0
    @State private var activeCheckout: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HeaderView(
                showCloseButton: true,
                menuAction:{},
                cartAction: {},
                closeAction: {
                    presentSideMenu.toggle()
                },
                backAction: {}
            )
                .padding([.leading, .trailing], 20)
            
            Text("CART")
                .font(tenorSans(24))
                .foregroundColor(.black)
                .padding([.leading, .trailing], 20)
            
            if cartItems.count > 0 {
                CartFullView()
            }else{
                EmptyCartView()
            }
           
            if activeCheckout == true {
                NavigationLink {
                    LoginView(cartItems: $cartItems , showLogin: .constant(true), selectedTab: .constant(.home), isCheckout: true)
                        .ignoresSafeArea(.keyboard)
                } label: {
                    HStack {
                        Image("Cart")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .colorInvert()
                        Text("Checkout")
                            .font(tenorSans(16))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                    }
                    .padding(.bottom, 15)
                    .frame(height: 80)
                    .frame(maxWidth: .infinity)
                    .background(.black)
                }
            } else {
                Button {
                    
                } label: {
                    HStack {
                        Image("Cart")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .colorInvert()
                        Text("Checkout")
                            .font(tenorSans(16))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                    }
                    .padding(.bottom, 15)
                    .frame(height: 80)
                    .frame(maxWidth: .infinity)
                    .background(Color.Placeholder)
                }.disabled(!activeCheckout)
            }
        }
        .padding(.top, 60)
        .onAppear{
            updateCartValue(items: cartItems)
            updateActive(items: cartItems)
        }
        
    }
    
    @ViewBuilder
    func SideMenuTopView() -> some View {
        VStack {
            HStack {
                Button {
                    print(presentSideMenu.hashValue)
                    presentSideMenu.toggle()
                } label: {
                    Image("Close")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                .frame(width: 34, height: 34)
                Spacer()
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.leading, 10)
        .padding(.top, 40)
        .padding(.bottom, 30)
    }
    
    // This is show when cart is empty
    @ViewBuilder
    func EmptyCartView() -> some View {
        VStack(alignment: .leading) {
            Text("You have no items in your cart")
                .font(tenorSans(16))
                .multilineTextAlignment(.center)
                .foregroundColor(Color.Placeholder)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    @ViewBuilder
    func CartFullView() -> some View {
        VStack(alignment: .leading) {
            VStack {
                ScrollView(.vertical) {
                    ForEach(0..<cartItems.count, id: \.self) { i in
                        if cartItems[i].count > 0 {
                            CartItemView(item: $cartItems[i]) {
                                updateCartValue(items:cartItems)
                                updateActive(items: cartItems)
                            }
                        }
                    }
                }.padding([.leading, .trailing], 20)
                
                VStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(height: 1)
                        .background(Color.BodyGrey)
                    
                    HStack {
                        Text("SUB TOTAL")
                            .font(tenorSans(14))
                            .foregroundColor(.black)
                        
                        Spacer()
                        
                        Text("Rs.\(totalPrice)")
                            .font(tenorSans(16))
                            .foregroundColor(Color.Default)
                    }
                    .padding([.leading, .trailing], 20)
                    
                    Text("*shipping charges, taxes and discount codes   are calculated at the time of accounting. ")
                        .font(tenorSans(16))
                        .foregroundColor(Color.Placeholder)
                        .frame(height: 72, alignment: .topLeading)
                        .padding([.leading, .trailing], 20)
                    
                }.frame(height: 100)
                
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func updateCartValue(items: [CartItemModel]) {
        var value: Int = 0
        for item in items {
            value += (item.count * item.product.price)
        }
        totalPrice = value
    }
    
    func updateActive(items: [CartItemModel]) {
        var value: Bool = false
        for item in items {
            if item.count > 0 {
                value = true
            }
        }
        activeCheckout = value
    }
    
    
}

