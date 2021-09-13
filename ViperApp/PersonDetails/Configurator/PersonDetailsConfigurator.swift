//
//  PersonDetailsPersonDetailsConfigurator.swift
//  ViperApp
//
//  Created by Danishpan on 15/06/2021.
//  Copyright © 2021 Dair. All rights reserved.
//

import UIKit

class PersonDetailsModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController, with person: PeopleEntity.Person) {

        if let viewController = viewInput as? PersonDetailsViewController {
            configure(viewController: viewController, with: person)
        }
    }

    private func configure(viewController: PersonDetailsViewController, with person: PeopleEntity.Person) {

        let router = PersonDetailsRouter()

        let presenter = PersonDetailsPresenter(with: person)
        presenter.view = viewController
        presenter.router = router

        let interactor = PersonDetailsInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
