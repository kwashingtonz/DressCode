//
//  SideCategoriesView.swift
//  DressCode
//
//  Created by Kalindu Washington on 2024-03-24.
//

import SwiftUI

struct SideCategoriesViewTemp: View {
    
    @State var presentSideMenu = true
    @State var selectedGenderCategory = 1
    @State var selectedType = 0
    @State var selectedTab : Tab = .products
    
    var categories : [CategoryModel]
    var genderCategories : [GenderCategoryModel]
    
    var body: some View {
        ZStack {
            SideCategoriesView(categories: categories, genderCategories: genderCategories)
        }.background(.black)
    }
    
    @ViewBuilder
    private func SideCategoriesView(categories: [CategoryModel], genderCategories: [GenderCategoryModel]) -> some View {
        
        SideView(isShowing: $presentSideMenu, content: AnyView(SideCategoriesViewContents(presentSideMenu: $presentSideMenu, selectedGenderCategory: $selectedGenderCategory, selectedType: $selectedType, selectedTab: $selectedTab,categories: categories, genderCategories: genderCategories)), direction: .leading)
        
    }
}

struct SideCategoriesViewContents: View {
    @Binding var presentSideMenu: Bool
    @Binding var selectedGenderCategory: Int
    @Binding var selectedType: Int
    @Binding var selectedTab: Tab
    
    var categories : [CategoryModel]
    var genderCategories : [GenderCategoryModel]
    
    
    
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
                        
                        GenderView(isSelected: selectedGenderCategory == 0, title: "ANY")
                            .onTapGesture {
                                $selectedGenderCategory.wrappedValue = 0
                            }
                        
                        ForEach(0..<genderCategories.count, id: \.self) { i in
                            GenderView(isSelected: selectedGenderCategory == genderCategories[i].id, title: genderCategories[i].name)
                                .onTapGesture {
                                    $selectedGenderCategory.wrappedValue = genderCategories[i].id
                                }
                        }
                        
                    }
                    .frame(maxWidth: .infinity)
                    
                    CategoryItem(title: "All", action: {
                        $selectedType.wrappedValue = 0
                        selectedTab = .products
                        presentSideMenu.toggle()
                    })
                    
                    ForEach(0..<categories.count, id: \.self) { i in
                        CategoryItem(title: categories[i].name, action: {
                            $selectedType.wrappedValue = categories[i].id
                            selectedTab = .products
                            presentSideMenu.toggle()
                        })
                    }
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        HStack {
                            Image("Call")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 24, height: 24)
                            Text("(011) 0123 456")
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
                            Text("01, Negombo Road, Colombo")
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
    func CategoryItem(title: String, action: @escaping (ButtonAction)) -> some View {
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

