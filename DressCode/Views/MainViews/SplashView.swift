//
//  SplashView.swift
//  DressCode
//
//  Created by Kalindu Washington on 2024-03-24.
//

import SwiftUI

struct SplashView: View {
    
    @State private var size: Double = 0.5
    @State private var opacity: Double = 0.6
    
    var body: some View {
        ZStack {
            Color.Default
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            Image("Logo")
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear{
                    withAnimation(.easeIn(duration: 1.2)){
                        self.size = 0.7
                        self.opacity = 1.0
                    }
                }
        }
        .statusBarHidden()
    }
}

#Preview {
    SplashView()
}
