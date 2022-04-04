//
//  NetworkManager.swift
//  NYTimes
//
//  Created by Дмитрий Дмитрий on 04.04.2022.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    
    func fetch(from url: String, with completion: @escaping(Result<Article, Error>) -> Void) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let response = response else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            print(response)
            
            do {
                let article = try JSONDecoder().decode(Article.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(article))
                }
            } catch let error {
                completion(.failure(error))
            }
        }.resume()
    }
}


