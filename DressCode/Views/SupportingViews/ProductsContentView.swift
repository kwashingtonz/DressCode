//
//  ProductsContentView.swift
//  DressCode
//
//  Created by Kalindu Washington on 2024-03-25.
//

import SwiftUI

struct ProductsContentView: View {
    
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
                
                ScrollView(.vertical) {
                    VStack {
                        ScrollView(.vertical) {
                            LazyVGrid(columns: adaptiveColumns) {
                                ForEach(0..<products.count, id: \.self) { i in
                                    ProductItemView(product: products[i], products: products)
                                }
                                
                            }
                        }
                        .scrollIndicators(.hidden)
                    }.padding([.leading, .trailing], 20)
                }
                .edgesIgnoringSafeArea(.all)
            }
            .padding(.top, 56)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    ProductsContentView(products: searchObj)
}
