//
//  PersonDetailsPersonDetailsInitializer.swift
//  ViperApp
//
//  Created by Danishpan on 15/06/2021.
//  Copyright © 2021 Dair. All rights reserved.
//

import UIKit

class PersonDetailsModuleInitializer: NSObject {

    func viewController(with person: PeopleEntity.Person) -> UIViewController {
        let storyboard = UIStoryboard(name: "PersonDetails", bundle: Bundle.main)
        let vc: PersonDetailsViewController = storyboard.instantiateViewController(withIdentifier: "PersonDetailsViewController") as! PersonDetailsViewController
        let configurator = PersonDetailsModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: vc, with: person)
        
        return vc
    }

}
