//
//  ProductsContentView.swift
//  DressCode
//
//  Created by Kalindu Washington on 2024-03-25.
//

import SwiftUI
import AlertToast

struct ProductsContentView: View {
    
    @Binding var homeObject: HomeDataModel
    var products: [ProductModel]
    @State var searchText: String = ""
    @Binding var selectedGender: Int
    @Binding var selectedType: Int
    @State var selectedSort: Int = 0
    @State var prdcts : [ProductModel] = []
    
    @StateObject var prodVM : ProductViewModel = ProductViewModel()
    
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
                    .onChange(of: searchText) { newValue in
                        prodVM.fetchProducts(searchText: searchText, type: selectedType, gender: selectedGender, sorting: selectedSort, prds: $prdcts)
                    }
                
                HStack{
                    Menu {
                        Button{
                            $selectedGender.wrappedValue = 0;
                            prodVM.fetchProducts(searchText: searchText, type: selectedType, gender: 0, sorting: selectedSort, prds: $prdcts)
                        }label: {
                            Text("Any")
                            if selectedGender == 0 {
                                Image(systemName: "checkmark")
                            }
                        }
                        ForEach(0..<homeObject.genderCategories.count, id: \.self) { i in
                            Button{
                                $selectedGender.wrappedValue = homeObject.genderCategories[i].id
                                prodVM.fetchProducts(searchText: searchText, type: selectedType, gender: homeObject.genderCategories[i].id, sorting: selectedSort, prds: $prdcts)
                            }label: {
                                Text(homeObject.genderCategories[i].name)
                                if selectedGender == homeObject.genderCategories[i].id {
                                    Image(systemName: "checkmark")
                                }
                            }
                        }
                        
                    }label: {
                        if selectedGender == 0 {
                            Text("Gender")
                                .font(tenorSans(16))
                                .foregroundColor(Color.BodyGrey)
                        }else{
                            ForEach(0..<homeObject.genderCategories.count, id: \.self) { i in
                                if selectedGender == homeObject.genderCategories[i].id {
                                    Text(homeObject.genderCategories[i].name)
                                        .font(tenorSans(16))
                                        .foregroundColor(Color.Default)
                                }
                            }
                        }
                        
                        Image("Down")
                            .resizable()
                            .scaledToFit().frame(width: 10, height: 10)
                    }
                    .padding(.trailing, 30)
                    
                    Menu {
                        Button{
                            $selectedType.wrappedValue = 0
                            prodVM.fetchProducts(searchText: searchText, type: 0, gender: selectedGender, sorting: selectedSort, prds: $prdcts)
                        }label: {
                            Text("Any")
                            if selectedType == 0 {
                                Image(systemName: "checkmark")
                            }

                        }
                        ForEach(0..<homeObject.categories.count, id: \.self) { i in
                            Button{
                                $selectedType.wrappedValue = homeObject.categories[i].id
                                prodVM.fetchProducts(searchText: searchText, type: homeObject.categories[i].id, gender: selectedGender, sorting: selectedSort, prds: $prdcts)
                            }label: {
                                Text(homeObject.categories[i].name)
                                if selectedType == homeObject.categories[i].id {
                                    Image(systemName: "checkmark")
                                }
                            }
                        }
                    }label: {
                        if selectedType == 0 {
                            Text("Type")
                                .font(tenorSans(16))
                                .foregroundColor(Color.BodyGrey)
                        }else{
                            ForEach(0..<homeObject.categories.count, id: \.self) { i in
                                if selectedType == homeObject.categories[i].id {
                                    Text(homeObject.categories[i].name)
                                        .font(tenorSans(16))
                                        .foregroundColor(Color.Default)
                                }
                            }
                        }
                        Image("Down")
                            .resizable()
                            .scaledToFit().frame(width: 10, height: 10)
                    }
                    
                    Spacer()
                    
                    Menu {
                        Button{
                            selectedSort = 0
                            prodVM.fetchProducts(searchText: searchText, type: selectedType, gender: selectedGender, sorting: 0, prds: $prdcts)
                        }label: {
                            Text("Price Lowest to Highest")
                            if selectedSort == 0 {
                                Image(systemName: "checkmark")
                            }
                        }
                        Button{
                            selectedSort = 1
                            prodVM.fetchProducts(searchText: searchText, type: selectedType, gender: selectedGender, sorting: 1, prds: $prdcts)
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
                .padding(.bottom,10)
                .padding(.top, -5)
                .padding([.trailing,.leading], 20)
                
                ScrollView(.vertical) {
                    VStack {
                        ScrollView(.vertical) {
                            if prodVM.isLoading == true {
                                ZStack {
                                    Color.white.edgesIgnoringSafeArea(.all)
                                }
                                .toast(isPresenting: $prodVM.isLoading, duration: 2){
                                    AlertToast(displayMode: .alert, type: .loading, title: "Loading")
                                }
                            }else{
                                if prdcts.count > 0 {
                                    LazyVGrid(columns: adaptiveColumns) {
                                        ForEach(0..<prdcts.count, id: \.self) { i in
                                            ProductItemView(product: prdcts[i], products: products, cartItems: $homeObject.cartItems, homeObjt: $homeObject)
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
                        }
                        .scrollIndicators(.hidden)
                    }
                    .padding([.leading, .trailing], 20)
                    .onAppear{
                        self.prodVM.fetchProducts(searchText: searchText, type: selectedType, gender: selectedGender, sorting: selectedSort, prds: $prdcts)
                    }
                }
                .edgesIgnoringSafeArea(.all)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    ProductsContentView(homeObject: .constant(homeObj), products: [prod1, prod2, prod3, prod4], selectedGender: .constant(0), selectedType: .constant(0))
}
