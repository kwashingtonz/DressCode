//
//  CommonResponse.swift
//  DressCode
//
//  Created by Kalindu Washington on 2024-03-30.
//

import Foundation

struct CommonResponse: Decodable {
    let status: Bool
    let extra: ExtraData
    let code: String
    let count: Int
}

enum ExtraData: Decodable {
    case string(String)
    case productModels([ProductModel])
    case homeModel(HomeDataModel)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        if let stringValue = try? container.decode(String.self) {
            self = .string(stringValue)
            return
        }
        
        if let productModelsValue = try? container.decode([ProductModel].self) {
            self = .productModels(productModelsValue)
            return
        }
        
        if let homeModelsValue = try? container.decode(HomeDataModel.self) {
            self = .homeModel(homeModelsValue)
            return
        }
        
        throw DecodingError.dataCorruptedError(in: container, debugDescription: "Failed to decode ExtraData")
    }
}
