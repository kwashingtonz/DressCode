//
//  HomeView.swift
//  DressCode
//
//  Created by Kalindu Washington on 2024-03-24.
//

import SwiftUI
import AlertToast

struct HomeView: View {
    
    @State private var selectedTab: Tab = .home
    @State private var showLogin: Bool = false
    
    @State var presentSideMenu: Bool = false
    @State var presentSideCart: Bool = false
    
    @State var homeObject: HomeDataModel
    
    @State var selectedGenderCategory: Int = 0
    @State var selectedType: Int = 0
    
    @State private var isFirstTime: Bool
    
    @StateObject var homeVM : HomeViewModel = HomeViewModel()
    
    init() {
        UITabBar.appearance().isHidden = true
        self.homeObject = nullHomeObj
        self.isFirstTime = true
    }
    
    init(homeObjt: HomeDataModel, isFirstTime: Bool){
        self.homeObject = homeObjt
        self.isFirstTime = isFirstTime
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        ZStack {
            if homeVM.isLoading == true {
                ZStack {
                    Color.Default.edgesIgnoringSafeArea(.all)
                }
                .toast(isPresenting: $homeVM.isLoading, duration: 2){
                    AlertToast(displayMode: .alert, type: .loading, title: "Loading")
                }
            } else {
                ZStack {
                    VStack(spacing: 0) {
                        TabView(selection: $selectedTab){
                            HStack{
                                if selectedTab == .home {
                                    HomeContentView(selectedTab:$selectedTab,homeObject: $homeObject)
                                }
                                
                                if selectedTab == .products {
                                    ProductsContentView(homeObject: $homeObject, products: homeObject.products, selectedGender: $selectedGenderCategory, selectedType: $selectedType)
                                }
                            }
                            .tag(selectedTab)
                        }
                        
                    }
                    .padding(.top, 56)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .overlay(alignment: .top) {
                    HeaderView(
                        showMenuButton: selectedTab == .products ? false : true,
                        showCartButton: true,
                        menuAction:{
                            presentSideMenu.toggle()
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
                .overlay(alignment:.bottom) {
                    NavBarView(selectedTab: $selectedTab, showLogin: $showLogin)
                }
                .ignoresSafeArea(.keyboard)
                
                if selectedTab == .profile {
                    if showLogin == true {
                        LoginView(cartItems: $homeObject.cartItems, showLogin: $showLogin, selectedTab: $selectedTab)
                            .transition(.opacity)
                    }
                }
                
                SideMenu()
                SideCart()
            }
        }
        .navigationBarHidden(true)
        .onAppear{
            if isFirstTime == true {
                self.homeVM.fetchData(hObj: $homeObject)
            }
        }
    }
    
    @ViewBuilder
    private func SideMenu() -> some View {
        SideView(isShowing: $presentSideMenu, content: AnyView(SideCategoriesViewContents(presentSideMenu: $presentSideMenu, selectedGenderCategory: $selectedGenderCategory, selectedType: $selectedType, selectedTab: $selectedTab,categories: homeObject.categories, genderCategories: homeObject.genderCategories)), direction: .leading)
    }

    @ViewBuilder
    private func SideCart() -> some View {
        SideView(isShowing: $presentSideCart, content: AnyView(SideCartViewContents(presentSideMenu: $presentSideCart, cartItems: $homeObject.cartItems)), direction: .trailing)
    }
}

#Preview {
    HomeView()
}
