//
//  MoviesCVCell.swift
//  ViperApp
//
//  Created by Даир Алаев on 13.06.2021.
//

import UIKit
import Kingfisher

class MoviesCVCell: UICollectionViewCell {

    public static let identifier: String = "MoviesCVCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "MoviesCVCell", bundle: nil)
    }

    public var movie: TrendingMovieEntity.Movie? {
        didSet {
            if let movie = movie {
                let posterURL = URL(string: "https://image.tmdb.org/t/p/w400" + (movie.poster ?? ""))!
                imageView.kf.setImage(with: posterURL)
                titleLabel.text = movie.title
                ratingLabel.text = "\(movie.rating ?? 0)"
                if movie.rating ?? 0 < 5 {
                    ratingView.backgroundColor = .red
                } else if movie.rating ?? 0 < 7 {
                    ratingView.backgroundColor = .gray
                }
            }
        }
    }
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var ratingView: UIView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        ratingView.layer.cornerRadius = 13
        ratingView.layer.masksToBounds = true
    }

}
