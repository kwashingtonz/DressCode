//
//  ProductsContentView.swift
//  DressCode
//
//  Created by Kalindu Washington on 2024-03-25.
//

import SwiftUI

struct ProductsContentView: View {
    
    @Binding var homeObject: HomeDataModel
    var products: [ProductModel]
    @State var searchText: String = ""
    @Binding var selectedGender: Int
    @Binding var selectedType: Int
    @State var selectedSort: Int = 0
    
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
                            selectedGender = 0;
                        }label: {
                            Text("Any")
                            if selectedGender == 0 {
                                Image(systemName: "checkmark")
                            }
                        }
                        ForEach(0..<homeObject.genderCategories.count, id: \.self) { i in
                            Button{
                                selectedGender = homeObject.genderCategories[i].id
                            }label: {
                                Text(homeObject.genderCategories[i].name)
                                if selectedGender == homeObject.genderCategories[i].id {
                                    Image(systemName: "checkmark")
                                }
                            }
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
                            selectedType = 0
                        }label: {
                            Text("Any")
                            if selectedType == 0 {
                                Image(systemName: "checkmark")
                            }

                        }
                        ForEach(0..<homeObject.categories.count, id: \.self) { i in
                            Button{
                                selectedType = homeObject.categories[i].id
                            }label: {
                                Text(homeObject.categories[i].name)
                                if selectedType == homeObject.categories[i].id {
                                    Image(systemName: "checkmark")
                                }
                            }
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
                            selectedSort = 0
                        }label: {
                            Text("Price Lowest to Highest")
                            if selectedSort == 0 {
                                Image(systemName: "checkmark")
                            }
                        }
                        Button{
                            selectedSort = 1
                        }label: {
                            Text("Price Highest to Lowest")
                            if selectedSort == 1 {
                                Image(systemName: "checkmark")
                            }
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
                                        ProductItemView(product: products[i], products: products, cartItems: $homeObject.cartItems)
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
    ProductsContentView(homeObject: .constant(homeObj), products: [prod1, prod2, prod3, prod4], selectedGender: .constant(0), selectedType: .constant(0))
}
