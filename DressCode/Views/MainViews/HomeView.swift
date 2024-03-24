//
//  HomeView.swift
//  DressCode
//
//  Created by Kalindu Washington on 2024-03-24.
//

import SwiftUI

struct HomeView: View {
    
    @State private var selectedTab: Tab = .home
    
    @State var presentSideMenu: Bool = false
    @State var presentSideCart: Bool = false
    
    @State var homeObject: HomeDataModel = homeObj
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            ZStack {
                VStack(spacing: 0) {
                    TabView(selection: $selectedTab){
                        HStack{
                            if selectedTab == .home {
                                HomeContentView(homeObject: homeObject)
                            }
                            
                            if selectedTab == .products {
                                
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
                    showMenuButton: true,
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
                NavBarView(selectedTab: $selectedTab)
            }
            
            if(selectedTab == .profile){
                //LoginView
            }
            
            //SideMenu()
            //SideCart()
        }
    }
}

#Preview {
    HomeView()
}
