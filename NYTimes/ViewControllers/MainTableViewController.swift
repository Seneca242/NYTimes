//
//  MainTableViewController.swift
//  NYTimes
//
//  Created by Дмитрий Дмитрий on 03.04.2022.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    var articles: Article?
    private var loadingArticles = true
        
    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.contentInset.top = 5
        fetchArticles()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        loadingArticles ? 1 : articles?.results?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if loadingArticles{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "activityCell") else { fatalError() }
            tableView.separatorColor = tableView.backgroundColor
            return cell
        } else {
        tableView.separatorColor = .separator
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "articleCell", for: indexPath) as? ArticleTableViewCell else { fatalError() }
        guard let articles = articles?.results?[indexPath.section] else { fatalError()}
        cell.configure(with: articles)
        return cell
        }
    }
    
    private func fetchArticles() {
        NetworkManager.shared.fetch(from: APIManager.shared.url) { [weak self] results in
            switch results {
            case .success(let article):
                self?.loadingArticles = false
                self?.articles = article
                self?.tableView.reloadData()
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
