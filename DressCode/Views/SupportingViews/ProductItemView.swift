//
//  ProductItemView.swift
//  DressCode
//
//  Created by Kalindu Washington on 2024-03-24.
//

import SwiftUI
import Kingfisher

struct ProductItemView: View {
    var product: ProductModel
    var products: [ProductModel]
    @Binding var cartItems: [CartItemModel]
    
    var body: some View {
        
        NavigationLink {
            ProductDetailsView(product: product, products: products, cartItems: $cartItems)
        } label: {
            VStack {
                KFImage(URL(string: product.images[0]))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 165, height: 200)
                    .cornerRadius(5)
                    .shadow(radius: 1)
                
                Text(product.title)
                    .font(tenorSans(12))
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color.BodyGrey)
                    .frame(width: 165, alignment: .leading)
                
                Text("Rs.\(product.price)")
                    .font(tenorSans(16))
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color.Default)
                    .frame(width: 165, alignment: .leading)
                    .padding(.top, 2)
            }
        }

    }
}

#Preview {
    ProductItemView(product: prod2, products: searchObj, cartItems: .constant(cartItms))
}
