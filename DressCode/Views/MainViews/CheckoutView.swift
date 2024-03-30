//
//  CheckoutView.swift
//  DressCode
//
//  Created by Kalindu Washington on 2024-03-24.
//

import SwiftUI

struct CheckoutView: View {
    
    @Binding var cartItems: [CartItemModel]
    
    @Environment(\.presentationMode)
    var presentationMode: Binding<PresentationMode>
    
    @State private var totalPrice: Int = 0
    
    @State private var orderPlaced: Bool = false
    
    var body: some View {
        ZStack {
            MainCartView()
            if orderPlaced == true {
                PaymentSuccessView()
            }
        }
        .onAppear{
            updateCartValue(items: cartItems)
        }
        .ignoresSafeArea(edges: .bottom)
        .navigationBarHidden(true)
    }
    
    @ViewBuilder
    private func MainCartView() -> some View {
        Color.white.edgesIgnoringSafeArea(.all)
        ZStack {
            VStack(spacing: 0) {
                Text("CHECKOUT")
                    .font(tenorSans(24))
                    .kerning(4)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                .frame(height: 32, alignment: .center)
                
                Image("Divider")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 140)
                    .padding(.top, 10)
                
                ScrollView(.vertical) {
                    ForEach(0..<cartItems.count, id: \.self) { i in
                        if cartItems[i].count > 0 {
                            CartItemView( item: $cartItems[i], isCheckout: true ) {}
                        }
                    }
                }.padding([.leading, .trailing], 20)
                
                VStack(alignment: .leading, spacing: 15) {
                    
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 343, height: 1)
                        .background(Color.BodyGrey)
                    
                    Button {
                        
                    } label: {
                        HStack {
                            Image ("Voucher")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 27, height: 27)
                            
                            Text("Add promo code")
                                .font(tenorSans(19))
                                .foregroundColor(.BodyGrey)
                        }
                    }
                    
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 343, height: 1)
                        .background(Color.BodyGrey)
                    
                    Button {
                        
                    } label: {
                        HStack {
                            Image ("Delivery")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 27, height: 27)
                            
                            Text("Delivery")
                                .font(tenorSans(19))
                                .foregroundColor(.BodyGrey)
                        }
                    }
                    
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 343, height: 1)
                        .background(Color.BodyGrey)

                }
                
                Spacer()
                
                HStack(alignment: .bottom) {
                    Text("EST. TOTAL")
                        .font(tenorSans(14))
                        .kerning(2)
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    Text("Rs.\(totalPrice)")
                        .font(tenorSans(16))
                        .foregroundColor(Color.Default)
                    
                }
                .padding([.leading, .trailing], 20)
                .frame(height: 80)
                
                Button {
                    orderPlaced.toggle()
                } label: {
                    HStack {
                        Image("Cart")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .colorInvert()
                        
                        Text("Place Order")
                            .font(tenorSans(16))
                            .kerning(0.16)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                    }
                    .padding(.bottom, 15)
                    .frame(height: 80)
                    .frame(maxWidth: .infinity)
                    .background(.black)
                }
            }
            .padding(.top, 65)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay(alignment: .top) {
            HeaderView(
                showBackButton: true,
                menuAction:{
                },
                cartAction: {
                },
                closeAction: {
                },
                backAction: {
                    presentationMode.wrappedValue.dismiss()
                }
            )
            .padding([.leading, .trailing], 20)
        }
        
    }
    
    @ViewBuilder
    private func PaymentSuccessView() -> some View {
        ZStack {
            Color.BodyGrey.opacity(0.91).edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center, spacing: 10) {
                Text("PAYMENT SUCCESS")
                    .font(tenorSans(20))
                    .kerning(4)
                    .foregroundColor(.black)
                    .padding(.top, 20)
                
                Image("Success")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 70, height: 70)
                    
                Text("Your payment was success")
                    .font(tenorSans(18))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.BodyGrey)
                
                Text("Payment ID \(123456)")
                    .font(tenorSans(15))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.Label)
                
                NavigationLink{
                    HomeView()
                }label:{
                    HStack(alignment: .center, spacing: 10) {
                    Text("BACK TO HOME")
                        .font(tenorSans(16))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 12)
                    .overlay {
                        Rectangle()
                            .inset(by: 0.5)
                            .stroke(Color.black.opacity(0.5), lineWidth: 1)
                    }
                    .padding([.top, .bottom], 20)
                }
                
            }
            .frame(maxWidth: .infinity)
            .background(.white)
            .padding([.leading, .trailing], 16)
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func updateCartValue(items: [CartItemModel]) {
        var value: Int = 0
        for item in items {
            value += (item.count * item.product.price)
        }
        totalPrice = value
    }
}

#Preview {
    CheckoutView(cartItems: .constant(cartItms))
}

