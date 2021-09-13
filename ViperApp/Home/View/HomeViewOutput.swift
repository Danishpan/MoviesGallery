//
//  HomeHomeViewOutput.swift
//  ViperApp
//
//  Created by Danishpan on 02/06/2021.
//  Copyright © 2021 Dair. All rights reserved.
//

protocol HomeViewOutput {

    /**
        @author Danishpan
        Notify presenter that view is ready
    */

    func viewIsReady()
    func getTrendingMovies()
    func openTrendingMovies()
    func openSearch()

    
    func getTrendingPeople()
    
    func openMovieDetails(with id: Int)
    func openPersonDetails(with person: PeopleEntity.Person)
    

}
