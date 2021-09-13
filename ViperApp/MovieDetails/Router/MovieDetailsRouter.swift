//
//  MovieDetailsMovieDetailsRouter.swift
//  ViperApp
//
//  Created by Danishpan on 02/06/2021.
//  Copyright © 2021 Dair. All rights reserved.
//
import UIKit

class MovieDetailsRouter: MovieDetailsRouterInput {
    func openImages(with backdrops: [ImagesEntity.Image], with posters: [ImagesEntity.Image], controller: UIViewController) {
        let newController = ImagesModuleInitializer().viewController(with: backdrops, with: posters)
        controller.navigationController?.pushViewController(newController, animated: true)
    }
    
    func openReviewDetails(with review: ReviewEntity.Review, controller: UIViewController) {
        let newController = ReviewDetailsModuleInitializer().viewController(with: review)
        controller.navigationController?.pushViewController(newController, animated: true)
    }
    
    func openMovieDetails(with id: Int, controller: UIViewController) {
        let newController = MovieDetailsModuleInitializer().viewController(with: id)
        controller.navigationController?.pushViewController(newController, animated: true)
    }
}
