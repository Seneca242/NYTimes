//
//  ArticlesModel.swift
//  NYTimes
//
//  Created by Дмитрий Дмитрий on 04.04.2022.
//

import Foundation

struct Article: Decodable {
    let results: [ArticleDetails]?
}

struct ArticleDetails: Decodable {
    let display_title: String?
    let byline: String?
    let headline: String?
    let summary_short: String?
    let link: Link?
    let multimedia: Photo?
}

struct Link: Decodable {
    let url: String?
}

struct Photo: Decodable {
    let src: String?
}
