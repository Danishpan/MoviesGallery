//
//  MovieCell.swift
//  TrendingMovies
//
//  Created by Даир Алаев on 21.04.2021.
//

import UIKit
import Kingfisher

class MovieCell: UITableViewCell {
    
    public static let identifier: String = "MovieCell"
    
    @IBOutlet private weak var posterImageView: UIImageView!

    @IBOutlet weak var cellView: UIView!
    @IBOutlet private weak var ratingLabel: UILabel!
    @IBOutlet private weak var movieTitleLabel: UILabel!
    @IBOutlet private weak var releaseDateLabel: UILabel!
    
//    private let coreDataManager = CoreDataManager.shared
    
    public var movie: TrendingMovieEntity.Movie? {
        didSet {
            if let movie = movie {
                let posterURL = URL(string: "https://image.tmdb.org/t/p/w400" + (movie.poster ?? ""))!
                posterImageView.kf.setImage(with: posterURL)
                ratingLabel.text = "\(movie.rating ?? 0)"
                if movie.rating ?? 0 < 5 {
                    ratingLabel.textColor = .red
                } else if movie.rating ?? 0 < 7 {
                    ratingLabel.textColor = .gray
                }
                movieTitleLabel.text = movie.title
                releaseDateLabel.text = movie.releaseDate
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        posterImageView.layer.cornerRadius = 5
        posterImageView.layer.masksToBounds = true
        cellView.layer.cornerRadius = 10
        cellView.layer.masksToBounds = true
    }
}
