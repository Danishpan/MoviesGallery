//
//  TrendingMoviesTrendingMoviesViewInput.swift
//  ViperApp
//
//  Created by Danishpan on 01/06/2021.
//  Copyright © 2021 Dair. All rights reserved.
//

import UIKit

protocol TrendingMoviesViewInput: class {

    /**
        @author Danishpan
        Setup initial state of the view
    */

    func setupInitialState()
    
    func setTrendingMovies(_ movies: [TrendingMovieEntity.Movie])
    func setSoonMovies(_ movies: [TrendingMovieEntity.Movie])
    func setPlayingMovies(_ movies: [TrendingMovieEntity.Movie])


    
    func getController() -> UIViewController
}
