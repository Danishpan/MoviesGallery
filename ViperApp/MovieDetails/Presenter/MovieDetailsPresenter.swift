//
//  MovieDetailsMovieDetailsPresenter.swift
//  ViperApp
//
//  Created by Danishpan on 02/06/2021.
//  Copyright © 2021 Dair. All rights reserved.
//

class MovieDetailsPresenter: MovieDetailsModuleInput {

    weak var view: MovieDetailsViewInput!
    var interactor: MovieDetailsInteractorInput!
    var router: MovieDetailsRouterInput!

    private var movieId: Int
    
    init(with id: Int) {
        self.movieId = id
        print(movieId)
    }
    
    func viewIsReady() {
    }
    

}

extension MovieDetailsPresenter: MovieDetailsViewOutput {
    func openImages(with backdrops: [ImagesEntity.Image], with posters: [ImagesEntity.Image]) {
        router?.openImages(with: backdrops, with: posters, controller: view.getController())
    }
    
    
    func openReviews(with review: ReviewEntity.Review) {
        router?.openReviewDetails(with: review, controller: view.getController())
    }
    
    func openMovieDetails(with id: Int) {
        router?.openMovieDetails(with: id, controller: view.getController())
    }
    
    func setMovieDetails(_ movieDetails: MovieDetailsEntity) {
        view?.setMovieDetails(movieDetails)
    }
    
    func setVideoURL(_ videos: [TrailerVideoEntity.Video]) {
        view?.setVideoURL(videos)
    }
    
    func setReviews(_ reviews: [ReviewEntity.Review]) {
        view?.setReviews(reviews)
    }
    
    func setImages(_ backdrops: [ImagesEntity.Image], _ posters: [ImagesEntity.Image]) {
        view?.setImages(backdrops, posters)
    }
    
    func setSimilarMovies(_ movies: [TrendingMovieEntity.Movie]) {
        view?.setSimilarMovies(movies)
    }
    
}

extension MovieDetailsPresenter: MovieDetailsInteractorOutput {
    func getSimilarMovies() {
        interactor?.getSimilarMovies(with: movieId)
    }
    
    func getImages() {
        interactor?.getImages(with: movieId)
    }
    
    func getReviews() {
        interactor?.getReviews(with: movieId)
    }
    
    func getMovieDetails() {
        interactor?.getMovieDetails(with: movieId)
    }
    
    func getVideoURL() {
        interactor?.getVideoURL(with: movieId)
    }
    
}
