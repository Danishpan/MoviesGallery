//
//  HomeHomeRouterInput.swift
//  ViperApp
//
//  Created by Danishpan on 02/06/2021.
//  Copyright © 2021 Dair. All rights reserved.
//

import UIKit

protocol HomeRouterInput {
    func openTrendingMovies(controller: UIViewController)
    func openSearch(controller: UIViewController)
    
    func openMovieDetails(with id: Int, controller: UIViewController)
    func openPersonDetails(with person: PeopleEntity.Person, controller: UIViewController)

}
