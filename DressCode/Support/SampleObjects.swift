//
//  SampleObjects.swift
//  DressCode
//
//  Created by Kalindu Washington on 2024-03-24.
//

import SwiftUI

var prod1: ProductModel = .init(title: "Bear Appeal - Black Women’s Crop top", price: 990, description: "Black Crop Top with best premium cotton", images: ["https://i.postimg.cc/Gtz4jMzX/temp-Image-VSIyv-W.avif", "https://i.postimg.cc/50VjWcRP/temp-Image0-Dk-Duj.avif"], category:"tshirt", gender: "women", isTrending: true)
var prod2: ProductModel = .init(title: "Bear Appeal - Brown Men’s Oversized TShirt", price: 1090, description: "Brow Oversized Crew Neck TShirt with premiuim cotton", images: ["https://i.postimg.cc/xCBQVL89/temp-Imagea5-Gi-BW.avif", "https://i.postimg.cc/c4yWD7Pm/temp-Image-JCUSWj.avif"], category:"tshirt", gender: "men", isTrending: true)
var prod3: ProductModel = .init(title: "Bear Appeal - Navy Blue Casual Pants", price: 1500, description: "Navy blue casual pants makes you comfortable in casual dress code", images: ["https://i.postimg.cc/4yvS2chL/temp-Image-BDxldj.avif", "https://i.postimg.cc/t44MDYRk/temp-Image0w-DHt-X.avif"], category:"pants", gender: "women", isTrending: true)
var prod4: ProductModel = .init(title: "Bear Appeal - Salmon Crew Short Sleeve Neck TShirt", price: 990, description: "Salmon coloured short sleeve premmium cotton crew neck makes you comfy on hot days", images: ["https://i.postimg.cc/3RNrTKZF/temp-Image-Jfr3-YT.avif", "https://i.postimg.cc/J0B1sPvy/temp-Image-Soip31.avif"], category:"tshirt", gender: "men", isTrending: false)

var cat1: CategoryModel = .init(id: 0, name: "Tshirt")
var cat2: CategoryModel = .init(id: 1, name: "Pants")
var cat3: CategoryModel = .init(id: 2, name: "Shorts")

var gen1: GenderCategoryModel = .init(id: 0, name: "MEN")
var gen2: GenderCategoryModel = .init(id: 1, name: "WOMEN")
var gen3: GenderCategoryModel = .init(id: 2, name: "KIDS")

var homeObj : HomeDataModel = .init(heroImg:"https://i.postimg.cc/13H30ZqZ/temp-Imagep-Lv4-VY.avif", products: [prod1, prod2, prod3, prod4], categories: [cat1, cat2, cat3],genderCategories: [gen1, gen2, gen3] )

var searchObj : [ProductModel] = [prod1, prod2, prod3, prod4]

var cartItems: [CartItemModel] = [.init(product: prod1, count: 1), .init(product: prod2, count: 2), .init(product: prod3, count: 1)]
