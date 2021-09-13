//
//  MovieDetailsMovieDetailsViewOutput.swift
//  ViperApp
//
//  Created by Danishpan on 02/06/2021.
//  Copyright © 2021 Dair. All rights reserved.
//

protocol MovieDetailsViewOutput {

    /**
        @author Danishpan
        Notify presenter that view is ready
    */

    func viewIsReady()
    func getMovieDetails()
    func getVideoURL()
    func getReviews()
    func getImages()
    func getSimilarMovies()
    func openReviews(with review: ReviewEntity.Review)
    func openMovieDetails(with id: Int)
    func openImages(with backdrops: [ImagesEntity.Image], with posters: [ImagesEntity.Image])


}
