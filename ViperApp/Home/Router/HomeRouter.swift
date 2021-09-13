//
//  HomeHomeRouter.swift
//  ViperApp
//
//  Created by Danishpan on 02/06/2021.
//  Copyright © 2021 Dair. All rights reserved.
//
import UIKit

class HomeRouter: HomeRouterInput {
    func openSearch(controller: UIViewController) {
        let newController = SearchModuleInitializer().viewController()
        controller.navigationController?.pushViewController(newController, animated: true)
    }
    
    func openTrendingMovies(controller: UIViewController) {
        let newController = TrendingMoviesModuleInitializer().viewController()
        controller.navigationController?.pushViewController(newController, animated: true)
    }
    
    func openMovieDetails(with id: Int, controller: UIViewController) {
        let newController = MovieDetailsModuleInitializer().viewController(with: id)
        controller.navigationController?.pushViewController(newController, animated: true)
    }
    
    func openPersonDetails(with person: PeopleEntity.Person, controller: UIViewController) {
        let newController = PersonDetailsModuleInitializer().viewController(with: person)
        controller.navigationController?.pushViewController(newController, animated: true)
    }
    
}
