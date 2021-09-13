//
//  CollectionViewCell.swift
//  ViperApp
//
//  Created by Даир Алаев on 02.06.2021.
//

import UIKit
import Kingfisher

class MovieCVCell: UICollectionViewCell {
    public static let identifier: String = "MovieCVCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "MovieCVCell", bundle: nil)
    }

    public var movie: TrendingMovieEntity.Movie? {
        didSet {
            if let movie = movie {
                let posterURL = URL(string: "https://image.tmdb.org/t/p/w400" + (movie.poster ?? ""))!
                posterImageView.kf.setImage(with: posterURL)
                titleLabel.text = movie.title
                ratingLabel.text = "\(movie.rating ?? 0)"
            }
        }
    }
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingView: UIView!
    @IBOutlet weak var ratingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        posterImageView.layer.cornerRadius = 5
        posterImageView.layer.masksToBounds = true
        ratingView.layer.cornerRadius = 13
        ratingView.layer.masksToBounds = true
        // Initialization code
    }

}
