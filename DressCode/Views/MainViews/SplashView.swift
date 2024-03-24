//
//  SplashView.swift
//  DressCode
//
//  Created by Kalindu Washington on 2024-03-24.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
            Color.Default
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            Image("Logo")
        }
    }
}

#Preview {
    SplashView()
}
