//
//  HeaderView.swift
//  DressCode
//
//  Created by Kalindu Washington on 2024-03-24.
//

import SwiftUI

struct HeaderView: View {
    
    var showMenuButton: Bool = false
    var showCloseButton: Bool = false
    var showCartButton: Bool = false
    var showBackButton: Bool = false
    
    var menuAction: ButtonAction
    var cartAction: ButtonAction
    var closeAction: ButtonAction
    var backAction: ButtonAction
    
    
    var body: some View {
        ZStack(alignment: .center) {
            HStack {
                if showMenuButton == true {
                    Button {
                        menuAction()
                    } label: {
                        Image("Menu")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    .frame(width: 24, height: 24)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 20)
                }
                
                if showCloseButton == true {
                    Button {
                        closeAction()
                    } label: {
                        Image("Close")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    .frame(width: 24, height: 24)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 20)
                }
                
                if showBackButton == true {
                    Button {
                        backAction()
                    } label: {
                        Image("Back")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    .frame(width: 24, height: 24)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 20)
                }
                Spacer()
            }
                
            Image("Logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 84, height: 84)
            
            HStack {
                Spacer()
                
                if showCartButton == true {
                    Button {
                        cartAction()
                    } label: {
                        Image("Cart")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    .frame(width: 24, height: 24)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.trailing, 20)
                }
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 56)
        .background(.white)
        .zIndex(1)
        .shadow(radius: 0.3)
    }
}
