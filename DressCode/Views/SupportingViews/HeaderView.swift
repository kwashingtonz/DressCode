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
        ZStack {
            HStack {
                
                if showMenuButton {
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
                
                if showCloseButton {
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
                
                if showBackButton {
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
                
                Image("Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 84, height: 84)
                    .padding(
                                (showCartButton && !showBackButton && !showMenuButton && !showCloseButton) ? .leading
                                :
                                (!showCartButton && (showBackButton || showMenuButton || showCloseButton)) ?    .trailing
                                :
                                    .leading
                            ,   (showCartButton && !showBackButton && !showMenuButton && !showCloseButton)
                                ||
                                (!showCartButton && (showBackButton || showMenuButton || showCloseButton))
                                ? 135
                                : 0
                            )
                
                if showCartButton {
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
