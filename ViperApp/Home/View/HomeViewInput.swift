//
//  HomeHomeViewInput.swift
//  ViperApp
//
//  Created by Danishpan on 02/06/2021.
//  Copyright © 2021 Dair. All rights reserved.
//
import UIKit


protocol HomeViewInput: class {

    /**
        @author Danishpan
        Setup initial state of the view
    */

    func setupInitialState()
    func setTrendingMovies(_ movies: [TrendingMovieEntity.Movie])
    func setTrendingPeople(_ people: [PeopleEntity.Person])

    func getController() -> UIViewController
}
