//
//  PersonDetailsPersonDetailsPresenter.swift
//  ViperApp
//
//  Created by Danishpan on 15/06/2021.
//  Copyright © 2021 Dair. All rights reserved.
//

class PersonDetailsPresenter: PersonDetailsModuleInput, PersonDetailsInteractorOutput {

    weak var view: PersonDetailsViewInput!
    var interactor: PersonDetailsInteractorInput!
    var router: PersonDetailsRouterInput!

    private var person: PeopleEntity.Person
    
    init(with person: PeopleEntity.Person) {
        self.person = person
    }
    
    func viewIsReady() {

    }
    
}

extension PersonDetailsPresenter: PersonDetailsViewOutput {
    func getPerson() {
        view?.setPersonDetails(person)
    }
    
    func openMovieDetails(with id: Int) {
        router?.openMovieDetails(with: id, controller: view.getController())
    }
}
