//
//  HomeHomePresenter.swift
//  ViperApp
//
//  Created by Danishpan on 02/06/2021.
//  Copyright © 2021 Dair. All rights reserved.
//

class HomePresenter: HomeModuleInput{
    

    weak var view: HomeViewInput!
    var interactor: HomeInteractorInput!
    var router: HomeRouterInput!

    func viewIsReady() {

    }
}

extension HomePresenter: HomeInteractorOutput {
    
    func getTrendingMovies() {
        interactor?.getTrendingMovies()
    }
    
    func getTrendingPeople() {
        interactor?.getTrendingPeople()
    }
    
    func openTrendingMovies() {
        router?.openTrendingMovies(controller:view.getController())

    }
    
    func openMovieDetails(with id: Int) {
        router?.openMovieDetails(with: id, controller: view.getController())
    }
    
    func openPersonDetails(with person: PeopleEntity.Person) {
        router?.openPersonDetails(with: person, controller: view.getController())
    }
    
    func openSearch() {
        router?.openSearch(controller:view.getController())
    }
}

extension HomePresenter: HomeViewOutput {
    
    func setTrendingPeople(_ people: [PeopleEntity.Person]) {
        view?.setTrendingPeople(people)
    }
    
    func setTrendingMovies(_ movies: [TrendingMovieEntity.Movie]) {
        view?.setTrendingMovies(movies)
    }
    
}
