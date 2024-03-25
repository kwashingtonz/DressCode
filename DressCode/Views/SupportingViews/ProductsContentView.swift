//
//  ProductsContentView.swift
//  DressCode
//
//  Created by Kalindu Washington on 2024-03-25.
//

import SwiftUI

struct ProductsContentView: View {
    
    var homeObject: HomeDataModel
    var products: [ProductModel]
    @State var searchText: String = ""
    
    private let adaptiveColumns = [GridItem(.adaptive(minimum: 150))]
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                
                HStack {
                    Text("PRODUCTS")
                        .font(tenorSans(24))
                        .foregroundColor(.black)
                    Spacer()
                }
                .padding(.leading, 20)
                
                TextField("Search", text: $searchText)
                    .autocapitalization(.none)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .font(tenorSans(20))
                
                HStack{
                    Menu {
                        Button{
                            
                        }label: {
                            Text("Hi")
                        }
                    }label: {
                        Text("Gender")
                            .font(tenorSans(16))
                            .foregroundColor(Color.BodyGrey)
                        Image("Down")
                            .resizable()
                            .scaledToFit().frame(width: 10, height: 10)
                    }
                    .padding(.trailing, 50)
                    
                    Menu {
                        Button{
                            
                        }label: {
                            Text("Hi")
                        }
                    }label: {
                        Text("Type")
                            .font(tenorSans(16))
                            .foregroundColor(Color.BodyGrey)
                        Image("Down")
                            .resizable()
                            .scaledToFit().frame(width: 10, height: 10)
                    }
                    .padding(.trailing, 100)
                    
                    Menu {
                        Button{
                            
                        }label: {
                            Text("Hi")
                        }
                    }label: {
                        Image("Sort")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    .frame(width: 24, height: 24)
                }
                .padding(.bottom, 10)
                
                ScrollView(.vertical) {
                    VStack {
                        ScrollView(.vertical) {
                            if products.count > 0 {
                                LazyVGrid(columns: adaptiveColumns) {
                                    ForEach(0..<products.count, id: \.self) { i in
                                        ProductItemView(product: products[i], products: products)
                                    }
                                    
                                }
                            } else {
                                Text("No Products Available")
                                    .font(tenorSans(24))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(Color.Placeholder)
                                    .padding(.top, 200)
                            }
                            
                        }
                        .scrollIndicators(.hidden)
                    }.padding([.leading, .trailing], 20)
                }
                .edgesIgnoringSafeArea(.all)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.top, 10)
    }
}

#Preview {
    ProductsContentView(homeObject: homeObj, products: [prod1, prod2, prod3, prod4])
}
