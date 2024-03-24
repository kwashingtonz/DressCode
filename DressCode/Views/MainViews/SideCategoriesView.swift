//
//  SideCategoriesView.swift
//  DressCode
//
//  Created by Kalindu Washington on 2024-03-24.
//

import SwiftUI

struct SideCategoriesViewTemp: View {
    
    @State var presentSideMenu = true
    
    var categories : [CategoryModel]
    var genderCategories : [GenderCategoryModel]
    
    var body: some View {
        ZStack {
            SideCategoriesView(categories: categories, genderCategories: genderCategories)
        }.background(.black)
    }
    
    @ViewBuilder
    private func SideCategoriesView(categories: [CategoryModel], genderCategories: [GenderCategoryModel]) -> some View {
        
        SideView(isShowing: $presentSideMenu, content: AnyView(SideCategoriesViewContents(presentSideMenu: $presentSideMenu, categories: categories, genderCategories: genderCategories)), direction: .leading)
        
    }
}

struct SideCategoriesViewContents: View {
    @Binding var presentSideMenu: Bool
    
    var categories : [CategoryModel]
    var genderCategories : [GenderCategoryModel]
    
    @State private var selectedCategory: Int = 0
    
    var body: some View {
        HStack {
            ZStack {
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
                    .padding(.bottom, 10)
                    
                    HStack(spacing: 10) {
                        
                        GenderView(isSelected: selectedCategory == 0, title: "WOMEN")
                            .onTapGesture {
                                selectedCategory = 0
                            }
                        GenderView(isSelected: selectedCategory == 1, title: "MEN")
                            .onTapGesture {
                                selectedCategory = 1
                            }
                        GenderView(isSelected: selectedCategory == 2, title: "KIDS")
                            .onTapGesture {
                                selectedCategory = 2
                            }
                    }
                    .frame(maxWidth: .infinity)
                    
                    ForEach(0..<categories.count, id: \.self) { i in
                        CategoryItem(title: categories[i].name){}
                    }
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        HStack {
                            Image("Call")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 24, height: 24)
                            Text("(786) XXX-8616")
                                .font(tenorSans(16))
                                .foregroundColor(.black)
                            
                        }
                        .padding(.leading, 30)
                        .padding(.top, 20)
                        
                    }

                    Button {
                        
                    } label: {
                        HStack {
                            Image("Location")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 24, height: 24)
                            Text("Store locator")
                                .font(tenorSans(16))
                                .foregroundColor(.black)
                            
                        }
                        .padding(.leading, 30)
                        .padding(.top, 20)
                        
                    }

                    VStack(alignment: .center) {
                        Image("Divider")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 140)
                            .padding(.top, 10)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.top, 20)
                    
                    HStack(spacing: 30) {
                        Spacer()
                        Image("Twitter")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                        
                        Image("YouTube")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                        
                        Image("Instagram")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                        Spacer()
                    }
                    .padding(.top, 20)
                    .padding(.bottom, 20)
                    
                }
                .frame(maxWidth: .infinity)
                .padding(.top, 60)
            }
        }.padding([.leading, .trailing], 20)
    }
    
    @ViewBuilder
    func CategoryItem(title: String, action: @escaping (() -> Void)) -> some View {
        Button {
            action()
        } label: {
            VStack(alignment: .leading) {
                Text(title)
                    .font(tenorSans(16))
                    .foregroundColor(.BodyGrey)
            }
        }
        .frame(height: 50)
        .padding(.leading, 30)
        .padding(.top, 10)

    }
    
}


#Preview {
    SideCategoriesViewTemp(categories: [cat1, cat2, cat3], genderCategories: [gen1, gen2, gen3] )
}

