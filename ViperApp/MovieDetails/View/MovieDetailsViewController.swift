//
//  MovieDetailsMovieDetailsViewController.swift
//  ViperApp
//
//  Created by Danishpan on 02/06/2021.
//  Copyright © 2021 Dair. All rights reserved.
//

import UIKit
import Kingfisher
import youtube_ios_player_helper

class MovieDetailsViewController: UIViewController {
    
    var output: MovieDetailsViewOutput!
    private var movieDetails: MovieDetailsEntity? {
        didSet {
            if let movieDetails = movieDetails {
                let posterURL = URL(string: "https://image.tmdb.org/t/p/w400" + (movieDetails.poster ?? ""))!
                posterImageView.kf.setImage(with: posterURL)
                ratingLabel.text = "\(movieDetails.rating)"
                if movieDetails.rating < 5 {
                    ratingView.backgroundColor = .red
                } else if movieDetails.rating < 7 {
                    ratingView.backgroundColor = .gray
                }
                titleLabel.text = movieDetails.title
                overviewLabel.text = movieDetails.overview
                self.title = movieDetails.title
            }
        }
    }
        
    private var videos: [TrailerVideoEntity.Video] = [] {
        didSet {
            videos.forEach{ video in
                if video.site == "YouTube" && video.type == "Trailer" {
                    playerView.load(withVideoId: video.key ?? "")
                }
            }
        }
    }
    
    private var reviews: [ReviewEntity.Review] = [] {
        didSet {
            reviewCollectionView.reloadData()
        }
    }
    
    private var backdrops: [ImagesEntity.Image] = [] {
        didSet {
            imagesCollectionView.reloadData()
        }
    }
    
    private var posters: [ImagesEntity.Image] = []
    
    private var similarMovies: [TrendingMovieEntity.Movie] = [] {
        didSet {
            similarMoviesCV.reloadData()
        }
    }
    
    @IBOutlet private weak var ratingView: UIView!
    @IBOutlet private weak var posterImageView: UIImageView!
    @IBOutlet private weak var ratingLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var overviewLabel: UILabel!
    @IBOutlet weak var playerView: YTPlayerView!
    @IBOutlet weak var reviewCollectionView: UICollectionView!
    @IBOutlet weak var imagesCollectionView: UICollectionView!
    @IBOutlet weak var similarMoviesCV: UICollectionView!
    @IBOutlet weak var imagesButton: UIButton!
    

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
        
        ratingView.layer.cornerRadius = 10
        ratingView.layer.masksToBounds = true
        posterImageView.layer.cornerRadius = 20
        posterImageView.layer.masksToBounds = true
        playerView.layer.cornerRadius = 10
        playerView.layer.masksToBounds = true
        
        reviewCollectionView.delegate = self
        reviewCollectionView.dataSource = self
        reviewCollectionView.register(UINib(nibName: ReviewCVCell.identifier, bundle: Bundle(for: ReviewCVCell.self)), forCellWithReuseIdentifier: ReviewCVCell.identifier)
        
        imagesCollectionView.delegate = self
        imagesCollectionView.dataSource = self
        imagesCollectionView.register(UINib(nibName: ImagesCVCell.identifier, bundle: Bundle(for: ImagesCVCell.self)), forCellWithReuseIdentifier: ImagesCVCell.identifier)
        
        similarMoviesCV.delegate = self
        similarMoviesCV.dataSource = self
        similarMoviesCV.register(UINib(nibName: MoviesCVCell.identifier, bundle: Bundle(for: MoviesCVCell.self)), forCellWithReuseIdentifier: MoviesCVCell.identifier)
        
        output.getMovieDetails()
        output.getVideoURL()
        output.getReviews()
        output.getImages()
        output.getSimilarMovies()
    }


    // MARK: MovieDetailsViewInput
    func setupInitialState() {
    }
    @IBAction func imagesOpen(_ sender: Any) {
        output?.openImages(with: backdrops, with: posters)
    }
}

extension MovieDetailsViewController: MovieDetailsViewInput {
    func setSimilarMovies(_ movies: [TrendingMovieEntity.Movie]) {
        self.similarMovies = movies
    }
    
    func setImages(_ backdrops: [ImagesEntity.Image], _ posters: [ImagesEntity.Image]) {
        self.backdrops = backdrops
        self.posters = posters
    }
    
    func setReviews(_ reviews: [ReviewEntity.Review]) {
        self.reviews = reviews
    }
    
    func setVideoURL(_ videos: [TrailerVideoEntity.Video]) {
        self.videos = videos
    }
    
    func setMovieDetails(_ movieDetails: MovieDetailsEntity) {
        self.movieDetails = movieDetails
    }
    
    func getController() -> UIViewController {
        return self
    }
}

extension MovieDetailsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == reviewCollectionView {
            return reviews.count
        } else if collectionView == imagesCollectionView {
            return backdrops.count
        } else {
            return similarMovies.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == reviewCollectionView {
            let cell = reviewCollectionView.dequeueReusableCell(withReuseIdentifier: ReviewCVCell.identifier, for: indexPath) as! ReviewCVCell
            cell.review = reviews[indexPath.row]
            cell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapReviews(_:))))
            return cell
        } else if collectionView == imagesCollectionView {
            let cell = imagesCollectionView.dequeueReusableCell(withReuseIdentifier: ImagesCVCell.identifier, for: indexPath) as! ImagesCVCell
            cell.image = backdrops[indexPath.row]
            return cell
        } else {
            let cell = similarMoviesCV.dequeueReusableCell(withReuseIdentifier: MoviesCVCell.identifier, for: indexPath) as! MoviesCVCell
            cell.movie = similarMovies[indexPath.row]
            cell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapMovies(_:))))
            return cell
        }
            
    }
    
    @objc func tapReviews(_ sender: UITapGestureRecognizer) {

       let location = sender.location(in: self.reviewCollectionView)
       let indexPath = self.reviewCollectionView.indexPathForItem(at: location)

       if let index = indexPath {
        output?.openReviews(with: reviews[index.row])
       }
    }
    
    @objc func tapMovies(_ sender: UITapGestureRecognizer) {

       let location = sender.location(in: self.similarMoviesCV)
       let indexPath = self.similarMoviesCV.indexPathForItem(at: location)

       if let index = indexPath {
        output?.openMovieDetails(with: similarMovies[index.row].id)
       }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == similarMoviesCV {
            return CGSize(width: 200, height: 300)
        } else {
            return CGSize(width: 300, height: 200)
        }
    }

}


