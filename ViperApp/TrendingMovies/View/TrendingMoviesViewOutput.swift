//
//  TrendingMoviesTrendingMoviesViewOutput.swift
//  ViperApp
//
//  Created by Danishpan on 01/06/2021.
//  Copyright © 2021 Dair. All rights reserved.
//

protocol TrendingMoviesViewOutput {

    /**
        @author Danishpan
        Notify presenter that view is ready
    */

    func viewIsReady()
    func getTrendingMovies(_ pageNumber: Int)
    func getSoonMovies(_ pageNumber: Int)
    func getPlayingMovies(_ pageNumber: Int)

    func openMovieDetails(with id: Int)

}
