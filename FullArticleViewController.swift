//
//  ViewController.swift
//  NYTimes
//
//  Created by Дмитрий Дмитрий on 03.04.2022.
//

import UIKit
import WebKit

class FullArticleViewController: UIViewController, WKUIDelegate {

    @IBOutlet var articleLabel: UILabel!
    var webView: WKWebView!
    
    var fullArticleUrl: String?

    // MARK: - LifeCycle

    override func loadView() {
        overrideView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadWebView(fullArticleUrl)
    }
}

extension FullArticleViewController {

    private func overrideView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }

    private func loadWebView(_ string: String?) {
        guard let fullArticleUrl = fullArticleUrl else {
            return
        }

        let myURL = URL(string: fullArticleUrl)
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }

    private func fetchFullArticle() {
        guard let fullArticleUrl = fullArticleUrl else {
            return
        }

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
