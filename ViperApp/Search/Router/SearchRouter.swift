//
//  SearchSearchRouter.swift
//  ViperApp
//
//  Created by Danishpan on 15/06/2021.
//  Copyright © 2021 Dair. All rights reserved.
//
import UIKit

class SearchRouter: SearchRouterInput {
    func openMovieDetails(with id: Int, controller: UIViewController) {
        let newController = MovieDetailsModuleInitializer().viewController(with: id)
        controller.navigationController?.pushViewController(newController, animated: true)
    }
}
