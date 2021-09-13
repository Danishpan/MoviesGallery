//
//  MovieDetailsMovieDetailsInteractorInput.swift
//  ViperApp
//
//  Created by Danishpan on 02/06/2021.
//  Copyright © 2021 Dair. All rights reserved.
//

import Foundation

protocol MovieDetailsInteractorInput {
    func getMovieDetails(with id: Int)
    func getVideoURL(with id: Int)
    func getReviews(with id: Int)
    func getImages(with id: Int)
    func getSimilarMovies(with id: Int)
}
