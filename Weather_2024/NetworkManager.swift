//
//  NetworkManager.swift
//  Weather_2024
//
//  Created by Artem Zhuzhgin on 23.12.2023.
//

import UIKit

enum NetworkError: Error {
    case invalidUrl
    case decodingError
    case invalidData
}

class NetworkManager {
    
    
    static var shared = NetworkManager()
    
    private init() {}
    
    func fetchData(url: String, complition: @escaping(Result<Weather, NetworkError>)-> Void ) {
        guard let url = URL(string: url) else {
            complition(.failure(.invalidUrl))
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else {
                complition(.failure(.invalidData))
                return
            }
            let weather = try! JSONDecoder().decode(Weather.self, from: data)
            print(weather)

            DispatchQueue.main.async {
                complition(.success(weather))
            }

        }.resume()
    }
}
