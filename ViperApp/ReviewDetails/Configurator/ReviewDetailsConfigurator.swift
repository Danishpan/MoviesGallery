//
//  ReviewDetailsReviewDetailsConfigurator.swift
//  ViperApp
//
//  Created by Danishpan on 13/06/2021.
//  Copyright © 2021 Dair. All rights reserved.
//

import UIKit

class ReviewDetailsModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController, with review: ReviewEntity.Review) {

        if let viewController = viewInput as? ReviewDetailsViewController {
            configure(viewController: viewController, with: review)
        }
    }

    private func configure(viewController: ReviewDetailsViewController, with review: ReviewEntity.Review) {

        let router = ReviewDetailsRouter()

        let presenter = ReviewDetailsPresenter(with: review)
        presenter.view = viewController
        presenter.router = router

        let interactor = ReviewDetailsInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
