//
//  PersonDetailsPersonDetailsViewInput.swift
//  ViperApp
//
//  Created by Danishpan on 15/06/2021.
//  Copyright © 2021 Dair. All rights reserved.
//
import UIKit

protocol PersonDetailsViewInput: class {

    /**
        @author Danishpan
        Setup initial state of the view
    */
    func setPersonDetails(_ person: PeopleEntity.Person)
    func getController() -> UIViewController

    func setupInitialState()
}
