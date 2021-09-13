//
//  TrendingMoviesTrendingMoviesPresenter.swift
//  ViperApp
//
//  Created by Danishpan on 01/06/2021.
//  Copyright © 2021 Dair. All rights reserved.
//

class TrendingMoviesPresenter: TrendingMoviesModuleInput {
    

    

    weak var view: TrendingMoviesViewInput!
    var interactor: TrendingMoviesInteractorInput!
    var router: TrendingMoviesRouterInput!


}

extension TrendingMoviesPresenter: TrendingMoviesViewOutput {


    func setTrendingMovies(_ movies: [TrendingMovieEntity.Movie]) {
        view?.setTrendingMovies(movies)
    }
    
    func setSoonMovies(_ movies: [TrendingMovieEntity.Movie]) {
        view?.setSoonMovies(movies)
    }
    
    func setPlayingMovies(_ movies: [TrendingMovieEntity.Movie]) {
        view?.setPlayingMovies(movies)
    }
}

extension TrendingMoviesPresenter: TrendingMoviesInteractorOutput {
    
    func viewIsReady() {

    }
    
    func getPlayingMovies(_ pageNumber: Int) {
        interactor?.getPlayingMovies(pageNumber)
    }
    
    func getTrendingMovies(_ pageNumber: Int) {
        interactor?.getTrendingMovies(pageNumber)
    }
    
    func openMovieDetails(with id: Int) {
        router?.openMovieDetails(with: id, controller: view.getController())
    }

    func getSoonMovies(_ pageNumber: Int) {
        interactor?.getSoonMovies(pageNumber)
    }
    
}
