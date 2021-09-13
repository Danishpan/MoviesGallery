//
//  HomeHomeInteractorOutput.swift
//  ViperApp
//
//  Created by Danishpan on 02/06/2021.
//  Copyright © 2021 Dair. All rights reserved.
//

import Foundation

protocol HomeInteractorOutput: class {
    func setTrendingMovies(_ movies: [TrendingMovieEntity.Movie])
    
    func setTrendingPeople(_ people: [PeopleEntity.Person])

}
