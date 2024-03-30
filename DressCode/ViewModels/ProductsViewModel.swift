//
//  ProductsViewModel.swift
//  DressCode
//
//  Created by Kalindu Washington on 2024-03-24.
//

import Foundation
import SwiftUI
import Combine

class ProductViewModel: ObservableObject {
    
    @Published var isLoading = false
    private var cancellables = Set<AnyCancellable>()
    
    func fetchProducts(searchText: String ,type: Int, gender: Int, sorting: Int, prds: Binding<[ProductModel]>)
    {
        isLoading = true
         
         guard let url = URL(string: "http://localhost:4000/service/products/loadProducts") else {
             print("Invalid URL")
             return
         }

        let reqBody = ["searchText": searchText, "gender": gender ,"type": type, "sortType": sorting] as [String : Any]
        
        print(reqBody)
        
        let jsonData = try? JSONSerialization.data(withJSONObject: reqBody)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData

         
         URLSession.shared.dataTask(with: request) { data, response, error in
             guard let data = data else {
                 print("No data received: \(error?.localizedDescription ?? "Unknown error")")
                 return
             }
             
             do {
                 let decoder = JSONDecoder()
                 let resp = try decoder.decode(CommonResponse.self, from: data)
                 
                 if resp.status {
                     DispatchQueue.main.async {
                         if case let .productModels(prodModels) = resp.extra {
                             prds.wrappedValue = prodModels
                         }
                     }
                     self.isLoading = false
                 } else {
                     
                 }
             } catch {
                 print("Error decoding response: \(error.localizedDescription)")
             }
         }.resume()
    }
}

