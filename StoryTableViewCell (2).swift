//
//  StoryTableViewCell.swift
//  NetworkApp
//
//  Created by Oksana Tugusheva on 01.05.2021.
//

import UIKit

class StoryTableViewCell: UITableViewCell {

    @IBOutlet var sectionLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var abstractLabel: UILabel!
    @IBOutlet var bylineLabel: UILabel!
    @IBOutlet var thumbnailImage: UIImageView!
    
    func configure (with story: ArtStory) {
        sectionLabel.text = story.section?.uppercased()
        titleLabel.text = story.title
        abstractLabel.text = story.abstract
        bylineLabel.text = story.byline

        // TODO: - compactMap

        let minimumWidthThumbnail = story.multimedia?.filter( { $0.width != nil })
            .sorted(by: { $0.width! < $1.width! })
            .first

        guard let url = URL(string: minimumWidthThumbnail?.url ?? "") else {
            //                self?.thumbnailImage.image = UIImage(systemName: "airpods.gen3.chargingcase.wireless.fill")
            return }
        
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: url) else { return }
            
            DispatchQueue.main.async { [weak self] in
                self?.thumbnailImage.image = UIImage(data: imageData)
            }
        }
    }
}
