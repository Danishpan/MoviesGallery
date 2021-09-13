//
//  SearchSearchPresenter.swift
//  ViperApp
//
//  Created by Danishpan on 15/06/2021.
//  Copyright © 2021 Dair. All rights reserved.
//

class SearchPresenter: SearchModuleInput  {

    weak var view: SearchViewInput!
    var interactor: SearchInteractorInput!
    var router: SearchRouterInput!

    func viewIsReady() {

    }
}

extension SearchPresenter: SearchViewOutput {
    func setResults(_ movies: [TrendingMovieEntity.Movie]) {
        view?.setResults(movies)
    }
    
    func openMovieDetails(with id: Int) {
        router?.openMovieDetails(with: id, controller: view.getController())
    }
}

extension SearchPresenter: SearchInteractorOutput {
    
    func getResults(_ pageNumber: Int, _ query: String) {
        interactor?.getResults(pageNumber, query)
    }
}
