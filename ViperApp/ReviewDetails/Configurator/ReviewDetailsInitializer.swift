//
//  ReviewDetailsReviewDetailsInitializer.swift
//  ViperApp
//
//  Created by Danishpan on 13/06/2021.
//  Copyright © 2021 Dair. All rights reserved.
//

import UIKit

class ReviewDetailsModuleInitializer: NSObject {

    func viewController(with review: ReviewEntity.Review) -> UIViewController {
        let storyboard = UIStoryboard(name: "ReviewDetails", bundle: Bundle.main)
        let vc: ReviewDetailsViewController = storyboard.instantiateViewController(withIdentifier: "ReviewDetailsViewController") as! ReviewDetailsViewController
        let configurator = ReviewDetailsModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: vc, with: review)
        
        return vc
    }

}
