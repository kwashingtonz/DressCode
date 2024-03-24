//
//  ProductDetailsView.swift
//  DressCode
//
//  Created by Kalindu Washington on 2024-03-24.
//

import SwiftUI
import Kingfisher

struct ProductDetailsView: View {
    
    @Environment(\.presentationMode)
    var presentationMode: Binding<PresentationMode>
    
    @State var presentSideMenu = false
    @State var presentSideCart = false
    
    var product: ProductModel
    var products: [ProductModel]
    
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
                                Button {
                                    
                                } label: {
                                    Image("Add")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 25, height: 25)
                                }
                            }
                            
                            Text("$\(product.price)")
                                .font(tenorSans(28))
                                .multilineTextAlignment(.leading)
                                .foregroundColor(.Default)
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
                        
                        Text("You may also like")
                            .font(tenorSans(22))
                            .foregroundColor(.black)
                            .padding(.top, 20)
                        
                        Image("Divider")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 140)
                            .padding(.top, 10)
                        
                        VStack {
                            HStack(alignment: .top) {
                                ProductItemView(product: prod2, products: products)
                                ProductItemView(product: prod3, products: products)
                            }
                            
                            HStack(alignment: .top) {
                                ProductItemView(product: prod4, products: products)
                                ProductItemView(product: prod1, products: products)
                            }
                            
                            HStack(alignment: .center, spacing: 8) {
                                Text("Explore More")
                                    .font(tenorSans(20))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.black)
                                
                                Image(systemName: "arrow.forward")
                                    .frame(width: 18, height: 18)
                                
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
                    showCloseButton: true,
                    showCartButton: true,
                    menuAction:{
                        
                    },
                    cartAction: {
                        presentSideCart.toggle()
                    },
                    closeAction: {
                        presentationMode.wrappedValue.dismiss()
                    },
                    backAction: {
                    }
                )
            }
            
//            SideCart()
        }
        .navigationBarHidden(true)
        .ignoresSafeArea(edges: .bottom)
    }
    
//    @ViewBuilder
//    private func SideCart() -> some View {
//        SideView(isShowing: $presentSideCart, content: AnyView(SideCartViewContents(presentSideMenu: $presentSideCart)), direction: .trailing)
//    }
    
}

#Preview {
    ProductDetailsView(product: prod1, products: searchObj)
}
