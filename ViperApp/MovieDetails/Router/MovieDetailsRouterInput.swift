//
//  MovieDetailsMovieDetailsRouterInput.swift
//  ViperApp
//
//  Created by Danishpan on 02/06/2021.
//  Copyright © 2021 Dair. All rights reserved.
//

import UIKit

protocol MovieDetailsRouterInput {
    func openReviewDetails(with review: ReviewEntity.Review, controller: UIViewController)
    func openMovieDetails(with id: Int, controller: UIViewController)
    func openImages(with backdrops: [ImagesEntity.Image], with posters: [ImagesEntity.Image], controller: UIViewController)

}
