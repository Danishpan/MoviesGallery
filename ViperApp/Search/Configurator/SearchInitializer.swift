//
//  SearchSearchInitializer.swift
//  ViperApp
//
//  Created by Danishpan on 15/06/2021.
//  Copyright © 2021 Dair. All rights reserved.
//

import UIKit

class SearchModuleInitializer: NSObject {

    func viewController() -> UIViewController {
        let storyboard = UIStoryboard(name: "Search", bundle: Bundle.main)
        let vc: SearchViewController = storyboard.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
        let configurator = SearchModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: vc)
        
        return vc
    }

}
