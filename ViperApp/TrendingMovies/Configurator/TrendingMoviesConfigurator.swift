//
//  TrendingMoviesTrendingMoviesConfigurator.swift
//  ViperApp
//
//  Created by Danishpan on 01/06/2021.
//  Copyright © 2021 Dair. All rights reserved.
//

import UIKit

class TrendingMoviesModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? TrendingMoviesViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: TrendingMoviesViewController) {

        let router = TrendingMoviesRouter()

        let presenter = TrendingMoviesPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = TrendingMoviesInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
