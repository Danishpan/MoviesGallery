//
//  ImagesImagesConfigurator.swift
//  ViperApp
//
//  Created by Danishpan on 15/06/2021.
//  Copyright © 2021 Dair. All rights reserved.
//

import UIKit

class ImagesModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController, with backdrops: [ImagesEntity.Image], with posters: [ImagesEntity.Image]) {

        if let viewController = viewInput as? ImagesViewController {
            configure(viewController: viewController, with: backdrops, with: posters)
        }
    }

    private func configure(viewController: ImagesViewController, with backdrops: [ImagesEntity.Image], with posters: [ImagesEntity.Image]) {

        let router = ImagesRouter()

        let presenter = ImagesPresenter(with: backdrops, with: posters)
        presenter.view = viewController
        presenter.router = router

        let interactor = ImagesInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
