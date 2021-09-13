//
//  ReviewDetailsReviewDetailsViewController.swift
//  ViperApp
//
//  Created by Danishpan on 13/06/2021.
//  Copyright © 2021 Dair. All rights reserved.
//

import UIKit
import Kingfisher

class ReviewDetailsViewController: UIViewController {

    var output: ReviewDetailsViewOutput!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    private var review:ReviewEntity.Review? {
        didSet {
            if let review = review {
                let avatarURL = URL(string: "https://image.tmdb.org/t/p/w400" + (review.author_details.avatar_path ?? ""))!
                avatarImageView.kf.setImage(with: avatarURL)
                self.usernameLabel.text = review.author_details.username
                self.contentLabel.text = review.content
            }
        }
    }

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        avatarImageView.layer.cornerRadius = 40
        avatarImageView.layer.masksToBounds = true
        
        output.getReviews()
        output.viewIsReady()
    }


    // MARK: ReviewDetailsViewInput
    func setupInitialState() {
    }
}

extension ReviewDetailsViewController: ReviewDetailsViewInput {
    func setReviewDetails(_ review: ReviewEntity.Review) {
        self.review = review
    }
}
