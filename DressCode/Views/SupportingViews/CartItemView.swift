//
//  CartItemView.swift
//  DressCode
//
//  Created by Kalindu Washington on 2024-03-24.
//

import SwiftUI
import Kingfisher

struct CartItemView: View {
    
    @State var item: CartItemModel
    var isCheckout: Bool = false
    var onCartCountValueChanged: () -> ()
    
    var body: some View {
        ZStack {
            HStack(spacing: 20) {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 100, height: 133)
                    .background(
                        KFImage(URL(string: item.product.images[0]))
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 133)
                            .clipped()
                    )
                
                VStack(alignment: .leading) {
                    Text("\(item.product.title)")
                        .font(tenorSans(14))
                        .foregroundColor(.black)
                    
                    if isCheckout == false {
                        
                        HStack(spacing: 20) {
                            Button {
                                item.count -= 1
                                if item.count < 0 {
                                    item.count = 0
                                }
                                
                                onCartCountValueChanged()
                            } label: {
                                Circle()
                                    .foregroundColor(.white)
                                    .shadow(radius: 4)
                                    .overlay {
                                        Image(systemName: "minus")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .tint(.black)
                                            .frame(width: 14, height: 14)
                                    }
                            }
                            .frame(width: 24, height: 24)

                            Text("\(item.count)")
                                .font(tenorSans(24))
                                .foregroundColor(.black)
                            
                            Button {
                                item.count += 1
                                onCartCountValueChanged()
                            } label: {
                                Circle()
                                    .foregroundColor(.white)
                                    .shadow(radius: 4)
                                    .overlay {
                                        Image(systemName: "plus")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .tint(.black)
                                            .frame(width: 14, height: 14)
                                    }
                            }
                            .frame(width: 24, height: 24)
                            
                            Spacer()
                        }
                    } else {
                        HStack {
                            Text("Item(s) : \(item.count)")
                                .font(tenorSans(16))
                                .foregroundColor(.black)
                            
                            Spacer()
                        }
                    }
                    
                }
            }
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    CartItemView(item: .init(product: prod3, count: 1)){
        
    }
}

