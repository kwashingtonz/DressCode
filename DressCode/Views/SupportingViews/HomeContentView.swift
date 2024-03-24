//
//  HomeContentView.swift
//  DressCode
//
//  Created by Kalindu Washington on 2024-03-24.
//

import SwiftUI
import Kingfisher

struct HomeContentView: View {
    
    var prodObj : HomeDataModel
    
    var body: some View {
        ScrollView(.vertical) {
            HeroImageView(imgUrl: prodObj.heroImg)
            //                        NewArrivalView()
            //                        Image("Brand")
            //                            .resizable()
//                        .aspectRatio(contentMode: .fit)
            //                        CollectionsView()
            //                        TrendingHastagView()
            //                        FooterView()
            Spacer()
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    HomeContentView(prodObj: homeObj)
}

@ViewBuilder
private func HeroImageView(imgUrl : String) -> some View {

    let heroImg : String = imgUrl
    
    ZStack {
        KFImage(URL(string: heroImg))
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: .infinity)
            .frame(height: 620)
        
        
        Button {
            print("Explore Collection Button Clicked")
//                ProductsListView()
        } label: {
            RoundedRectangle(cornerRadius: 30).overlay {
                Text("Explore Collection")
                    .font(tenorSans(20))
                    .foregroundColor(.white)
            }
        }
        .frame(width: 253, height: 40)
        .tint(.black.opacity(0.4))
        .offset(.init(width: 0, height: 250))

    }
    
}
