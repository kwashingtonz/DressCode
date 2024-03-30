//
//  HomeViewModel.swift
//  DressCode
//
//  Created by Kalindu Washington on 2024-03-24.
//

import Foundation
import SwiftUI

class HomeViewModel : ObservableObject {
    
    @Published var isLoading = false
   
    func fetchData(hObj: Binding<HomeDataModel>) {
       isLoading = true
        
        guard let url = URL(string: "http://localhost:4000/service/home/loadHomeObj") else {
            print("Invalid URL")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
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
                        if case let .homeModel(homeDataModel) = resp.extra {
                            hObj.wrappedValue = homeDataModel
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
