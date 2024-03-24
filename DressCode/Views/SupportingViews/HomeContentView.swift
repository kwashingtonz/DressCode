//
//  HomeContentView.swift
//  DressCode
//
//  Created by Kalindu Washington on 2024-03-24.
//

import SwiftUI
import Kingfisher

struct HomeContentView: View {
    
    var homeObject : HomeDataModel
    
    var body: some View {
        ScrollView(.vertical) {
            HeroImageView(imgUrl: homeObject.heroImg)
            NewArrivalView(products: homeObject.products)
            Image("Brands")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Spacer()
        }
        .edgesIgnoringSafeArea(.all)
        .padding(.bottom, 50)
    }
}

#Preview {
    HomeContentView(homeObject: homeObj)
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
//            print("Explore Collection Button Clicked")
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

@ViewBuilder
private func NewArrivalView(products :[ProductModel]) -> some View {
    
    let trendingProds = products.filter { $0.isTrending }
    
    Text("New Arrivals")
        .font(tenorSans(28))
        .multilineTextAlignment(.center)
        .foregroundColor(.black)
        .frame(width: 225, height: 32, alignment: .top)
        .padding(.top, 25)
    
    Image("Divider")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 140)
        .padding(.top, 10)
    
    VStack {
        
        ForEach(0..<trendingProds.count / 2 + trendingProds.count % 2) { index in
            let startIndex = index * 2
            let endIndex = min(startIndex + 2, trendingProds.count)
            HStack {
                ForEach(startIndex..<endIndex) { productIndex in
                    ProductItemView(product: trendingProds[productIndex], products: products)
                }
            }
        }
        
        Button {
            
        } label: {
            HStack(alignment: .center, spacing: 8) {
                Text("Explore More")
                    .font(tenorSans(20))
                    .multilineTextAlignment(.center)
                    
                Image(systemName: "arrow.forward")
                    .frame(width: 18, height: 18)
            }
        }
        .tint(Color.BodyGrey)
        .padding(12)
    }
    
}
