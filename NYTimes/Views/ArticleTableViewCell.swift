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
    
    func configure(with article: ArticleDetails) {
        
//        filmTitleLabel.frame.height = 20
        
        filmTitleLabel.text = article.display_title?.uppercased()
        headlineLabel.text = article.headline
        summaryShortLabel.text = article.summary_short
        authorLabel.text = article.byline
        
        guard let url = URL(string: article.multimedia?.src ?? "") else { return }
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: url) else { return }
            
            DispatchQueue.main.async {
                self.articleImage.image = UIImage(data: imageData)
            }
        }
    }
}
