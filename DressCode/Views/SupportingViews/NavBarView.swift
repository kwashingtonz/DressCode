//
//  NavBarView.swift
//  DressCode
//
//  Created by Kalindu Washington on 2024-03-24.
//

import SwiftUI
 
struct NavBarView: View {
    
    @Binding var selectedTab: Tab
    @Binding var showLogin: Bool
    
    private var activeImg: String {
        selectedTab.rawValue + "_active"
    }
    
    var body: some View {
        VStack {
            HStack {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                        Spacer()
                        Image(selectedTab == tab ? activeImg : tab.rawValue)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40,  height: 40)
                        .scaleEffect(selectedTab == tab ? 1.20 : 1.00)
                        .onTapGesture {
                            withAnimation(.easeIn(duration: 0.1)){
                                selectedTab = tab
                                
                                if selectedTab == .profile {
                                    showLogin = true
                                }
                            }
                        }
                        Spacer()
                }
                .frame(maxWidth: .infinity)
                .frame(height: 56)
                .background(Color.Default)
                .zIndex(1)
                .shadow(radius: 0.3)
            }
        }
    }
}

#Preview {
    NavBarView(selectedTab: .constant(.home), showLogin: .constant(false))
}
