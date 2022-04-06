//
//  API.swift
//  NYTimes
//
//  Created by Дмитрий Дмитрий on 05.04.2022.
//

import Foundation

class APIManager {
    static let shared = APIManager()
    private init() {}
    
    private let api = "XcAEaYuECE4KKykulhjXMuwisyl3Xm8t"
    
    var url: String {
        "https://api.nytimes.com/svc/movies/v2/reviews/search.json?query=godfather&api-key=\(api)"
    }
}
