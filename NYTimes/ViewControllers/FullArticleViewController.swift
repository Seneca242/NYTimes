//
//  ViewController.swift
//  NYTimes
//
//  Created by Дмитрий Дмитрий on 03.04.2022.
//

import UIKit

class FullArticleViewController: UIViewController {

    @IBOutlet var articleLabel: UILabel!
    
//    var article: ArticleDetails!
    var fullArticleUrl: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        articleLabel.text = article.summary_short
    }
    
    private func fetchFullArticle() {
        NetworkManager.shared.fetchFullArticle(from: fullArticleUrl) { [weak self] results in
            switch results {
            case .success(let fullArtilce):
                self?.articleLabel.text = fullArtilce.url
            case .failure(let error):
                self?.showAlert(with: error.localizedDescription)
            }
        }
    }

    private func showAlert(with message: String) {
        let alert = UIAlertController(
            title: "Error",
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(
            title: "Ok",
            style: .default
        )
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

