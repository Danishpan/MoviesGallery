//
//  TrendingMoviesTrendingMoviesRouter.swift
//  ViperApp
//
//  Created by Danishpan on 01/06/2021.
//  Copyright © 2021 Dair. All rights reserved.
//
import UIKit

class TrendingMoviesRouter: TrendingMoviesRouterInput {
    func openMovieDetails(with id: Int, controller: UIViewController) {
        let newController = MovieDetailsModuleInitializer().viewController(with: id)
        controller.navigationController?.pushViewController(newController, animated: true)
    }
}
