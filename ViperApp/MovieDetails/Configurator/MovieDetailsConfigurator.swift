//
//  MovieDetailsMovieDetailsConfigurator.swift
//  ViperApp
//
//  Created by Danishpan on 02/06/2021.
//  Copyright © 2021 Dair. All rights reserved.
//

import UIKit

class MovieDetailsModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController, with id: Int) {

        if let viewController = viewInput as? MovieDetailsViewController {
            configure(viewController: viewController, with: id)
        }
    }

    private func configure(viewController: MovieDetailsViewController, with id: Int) {

        let router = MovieDetailsRouter()

        let presenter = MovieDetailsPresenter(with: id)
        presenter.view = viewController
        presenter.router = router

        let interactor = MovieDetailsInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
