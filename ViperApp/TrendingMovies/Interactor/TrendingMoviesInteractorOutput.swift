//
//  TrendingMoviesTrendingMoviesInteractorOutput.swift
//  ViperApp
//
//  Created by Danishpan on 01/06/2021.
//  Copyright © 2021 Dair. All rights reserved.
//

import Foundation

protocol TrendingMoviesInteractorOutput: class {
    func setTrendingMovies(_ movies: [TrendingMovieEntity.Movie])
    func setSoonMovies(_ movies: [TrendingMovieEntity.Movie])
    func setPlayingMovies(_ movies: [TrendingMovieEntity.Movie])

}
