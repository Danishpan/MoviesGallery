//
//  TrendingMoviesTrendingMoviesInteractorInput.swift
//  ViperApp
//
//  Created by Danishpan on 01/06/2021.
//  Copyright © 2021 Dair. All rights reserved.
//

import Foundation

protocol TrendingMoviesInteractorInput {
    func getTrendingMovies(_ pageNumber: Int)
    func getSoonMovies(_ pageNumber: Int)
    func getPlayingMovies(_ pageNumber: Int)
}
