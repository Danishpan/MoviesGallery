//
//  ReviewCVCell.swift
//  ViperApp
//
//  Created by Даир Алаев on 13.06.2021.
//

import UIKit
import Kingfisher

class ReviewCVCell: UICollectionViewCell {
    
    public static let identifier: String = "ReviewCVCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "ReviewCVCell", bundle: nil)
    }

    public var review: ReviewEntity.Review? {
        didSet {
            if let review = review {
                let avatarURL = URL(string: "https://image.tmdb.org/t/p/w400" + (review.author_details.avatar_path ?? ""))!
                avatarImageView.kf.setImage(with: avatarURL)
                usernameLabel.text = review.author_details.username
                reviewLabel.text = review.content
            }
        }
    }
    
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var reviewLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        avatarImageView.layer.cornerRadius = 25
        avatarImageView.layer.masksToBounds = true
        
        cellView.layer.cornerRadius = 10
        cellView.layer.masksToBounds = true
    }

}
