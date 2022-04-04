//
//  ArticleTableViewCell.swift
//  NYTimes
//
//  Created by Дмитрий Дмитрий on 03.04.2022.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {

    @IBOutlet var filmTitleLabel: UILabel!
    @IBOutlet var headlineLabel: UILabel!
    @IBOutlet var summaryShortLabel: UILabel!
    @IBOutlet var authorLabel: UILabel!
    @IBOutlet var articleImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    private func configure(with article: ArticleDetails) {
        filmTitleLabel.text = article.display_title
        headlineLabel.text = article.headline
        summaryShortLabel.text = article.summary_short
        authorLabel.text = article.byline
//        articleImage.image = UIImage(data: <#T##Data#>)
    }
    
    
}
