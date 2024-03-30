//
//  ProductDetailsView.swift
//  DressCode
//
//  Created by Kalindu Washington on 2024-03-24.
//

import SwiftUI
import Kingfisher
import AlertToast

struct ProductDetailsView: View {
    
    @Environment(\.presentationMode)
    var presentationMode: Binding<PresentationMode>
    
    @State var presentSideMenu = false
    @State var presentSideCart = false
    @State private var showToast = false
    
    var product: ProductModel
    var products: [ProductModel]
    @Binding var cartItems: [CartItemModel]
    @Binding var homeObjt: HomeDataModel
    
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            ZStack {
                VStack(spacing: 0) {
                    ScrollView {
                        TabView {
                            ForEach(0..<product.images.count, id: \.self) { i in
                                
                                KFImage(URL(string: product.images[i]))
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(height: 500)
                                    .clipped()
                                
                            }
                        }
                        .tabViewStyle(.page)
                        .indexViewStyle(.page(backgroundDisplayMode: .always))
                        .frame(height: 500)
                        .padding([.leading, .trailing], 20)
                        
                        VStack(alignment: .leading) {
                            HStack(alignment: .top) {
                                Text(product.title)
                                    .font(tenorSans(16))
                                    .multilineTextAlignment(.leading)
                                    .foregroundColor(.black)
                                Spacer()
                               
                            }
                            
                            HStack {
                                Text("Rs.\(product.price)")
                                    .font(tenorSans(28))
                                    .multilineTextAlignment(.leading)
                                    .foregroundColor(.Default)
                                
                                Spacer()
                                
                                Button {
                                    if let crtItmIndex = cartItems.firstIndex(where: { $0.product.title == product.title }) {
                                        $cartItems[crtItmIndex].count.wrappedValue += 1
                                          } else {
                                              $cartItems.wrappedValue.append(.init(product: product, count: 1))
                                          }
                                    self.showToast = true
                                } label: {
                                    Image("Plus")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 30, height: 30)
                                }
                            }
                            
                        }
                        .frame(maxWidth: .infinity)
                        .padding([.leading, .trailing], 20)
                        
                        Text("DESCRIPTION")
                            .font(tenorSans(18))
                            .foregroundColor(.black)
                            .padding(.top, 5)
                        
                        Text("\(product.description)")
                            .font(tenorSans(16))
                            .foregroundColor(.black)
                            .padding(.top, 3)
                            .padding([.leading, .trailing], 20)
                        
                        let similarProds = products.filter { $0.category == product.category && $0.title != product.title }
                        
                        if similarProds.count > 0 {
                            Text("You may also like")
                                .font(tenorSans(22))
                                .foregroundColor(.black)
                                .padding(.top, 20)
                            
                            Image("Divider")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 140)
                                .padding(.top, 10)
                        }
                        
                        VStack {
                            
                            ForEach(0..<similarProds.count / 2 + similarProds.count % 2) { index in
                                let startIndex = index * 2
                                let endIndex = min(startIndex + 2, similarProds.count)
                                HStack {
                                    ForEach(startIndex..<endIndex) { productIndex in
                                        ProductItemView(product: similarProds[productIndex], products: products, cartItems: $cartItems, homeObjt: $homeObjt
                                        )
                                    }
                                }
                            }
                            
                            NavigationLink{
                                HomeView(homeObjt: homeObjt, isFirstTime: false)
                            }label: {
                                HStack(alignment: .center, spacing: 8) {
                                    Text("Explore More")
                                        .font(tenorSans(20))
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(.black)

                                    Image(systemName: "arrow.forward")
                                        .frame(width: 18, height: 18)

                                }
                            }
                            .padding(12)
                            
                        }
                    }
                    .padding(.bottom, 30)
                }
                .padding(.top, 56)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(alignment: .top) {
                HeaderView(
                    showCloseNavButton: true,
                    showCartButton: true,
                    homeObjt: homeObjt,
                    menuAction:{
                    },
                    cartAction: {
                        presentSideCart.toggle()
                    },
                    closeAction: {
                    },
                    backAction: {
                    }
                )
            }
            
            SideCart()
        }
        .navigationBarHidden(true)
        .ignoresSafeArea(edges: .bottom)
        .toast(isPresenting: $showToast, duration: 2){
            AlertToast(displayMode: .alert, type: .regular, title: "Added to cart")
        }
    }
    
    @ViewBuilder
    private func SideCart() -> some View {
        SideView(isShowing: $presentSideCart, content: AnyView(SideCartViewContents(presentSideMenu: $presentSideCart, cartItems: $cartItems)), direction: .trailing)
    }
    
}

#Preview {
    ProductDetailsView(product: prod1, products: searchObj, cartItems: .constant(cartItms), homeObjt: .constant(homeObj))
}
