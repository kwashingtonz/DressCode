//
//  ProductModel.swift
//  DressCode
//
//  Created by Kalindu Washington on 2024-03-24.
//

import Foundation

struct ProductModel : Decodable {
    var title: String
    var price: Int
    var description: String
    var images: [String]
    var category: Int
    var gender: Int
    var isTrending: Bool
}
