//
//  NetworkManager.swift
//  NYTimes
//
//  Created by Дмитрий Дмитрий on 04.04.2022.
//

import UIKit

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    
    func fetch(from url: String, with completion: @escaping(Result<Article, Error>) -> Void) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let response = response else {
                completion(.failure(error?.localizedDescription as! Error))
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
    
    func fetchFullArticle(from url: String, with completion: @escaping(Result<Link, Error>) -> Void) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let response = response else {
                completion(.failure(error?.localizedDescription as! Error))
                return
            }
            print(response)
            
            do {
                let fullArticle = try JSONDecoder().decode(Link.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(fullArticle))
                }
            } catch let error {
                completion(.failure(error))
            }
        }.resume()
    }
}


