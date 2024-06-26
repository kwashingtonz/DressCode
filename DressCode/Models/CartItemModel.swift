//
//  CartItemModel.swift
//  DressCode
//
//  Created by Kalindu Washington on 2024-03-25.
//

import Foundation

class CartItemModel : Decodable {
    var product: ProductModel
    var count: Int = 0
    
    init(product: ProductModel, count: Int) {
        self.product = product
        self.count = count
    }
    
}
