//
//  ContentView.swift
//  DressCode
//
//  Created by Kalindu Washington on 2024-03-24.
//

import SwiftUI

struct ContentView: View {
    @State private var showSplash = true
    var body: some View {
        ZStack {
            if showSplash {
                SplashView()
                    .transition(.opacity)
                    
            } else {
                HomeView()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                withAnimation(.easeInOut(duration: 0.5)) {
                    showSplash = false
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
