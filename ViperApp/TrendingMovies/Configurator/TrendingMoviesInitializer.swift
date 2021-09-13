//
//  TrendingMoviesTrendingMoviesInitializer.swift
//  ViperApp
//
//  Created by Danishpan on 01/06/2021.
//  Copyright © 2021 Dair. All rights reserved.
//

import UIKit

class TrendingMoviesModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var trendingmoviesViewController: TrendingMoviesViewController!

    func viewController() -> UIViewController {
        let storyboard = UIStoryboard(name: "TrendingMoviesStoryboard", bundle: Bundle.main)
        let vc: TrendingMoviesViewController = storyboard.instantiateViewController(withIdentifier: "TrendingMoviesViewController") as! TrendingMoviesViewController
        let configurator = TrendingMoviesModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: vc)
        
        return vc
    }

}
