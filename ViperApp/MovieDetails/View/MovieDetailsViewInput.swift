//
//  MovieDetailsMovieDetailsViewInput.swift
//  ViperApp
//
//  Created by Danishpan on 02/06/2021.
//  Copyright © 2021 Dair. All rights reserved.
//
import UIKit

protocol MovieDetailsViewInput: class {

    /**
        @author Danishpan
        Setup initial state of the view
    */

    func setupInitialState()
    
    func setMovieDetails(_ movieDetails: MovieDetailsEntity)
    
    func setVideoURL(_ videos: [TrailerVideoEntity.Video])
    
    func setReviews(_ reviews: [ReviewEntity.Review])
    
    func setImages(_ backdrops: [ImagesEntity.Image], _ posters: [ImagesEntity.Image])
    
    func setSimilarMovies(_ movies: [TrendingMovieEntity.Movie])

    func getController() -> UIViewController

}
