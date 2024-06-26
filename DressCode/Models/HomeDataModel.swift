//
//  HomeDataModel.swift
//  DressCode
//
//  Created by Kalindu Washington on 2024-03-24.
//

import Foundation

struct HomeDataModel : Decodable {
    var heroImg :String
    var products : [ProductModel]
    var categories : [CategoryModel]
    var genderCategories : [GenderCategoryModel]
    var cartItems : [CartItemModel]
}
