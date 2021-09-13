//
//  SearchSearchViewInput.swift
//  ViperApp
//
//  Created by Danishpan on 15/06/2021.
//  Copyright © 2021 Dair. All rights reserved.
//
import UIKit

protocol SearchViewInput: class {

    /**
        @author Danishpan
        Setup initial state of the view
    */
    func setResults(_ movies: [TrendingMovieEntity.Movie])
    func getController() -> UIViewController

    func setupInitialState()
}
