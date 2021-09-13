//
//  ImagesImagesInitializer.swift
//  ViperApp
//
//  Created by Danishpan on 15/06/2021.
//  Copyright © 2021 Dair. All rights reserved.
//

import UIKit

class ImagesModuleInitializer: NSObject {

    func viewController(with backdrops: [ImagesEntity.Image], with posters: [ImagesEntity.Image]) -> UIViewController {
        let storyboard = UIStoryboard(name: "Images", bundle: Bundle.main)
        let vc: ImagesViewController = storyboard.instantiateViewController(withIdentifier: "ImagesViewController") as! ImagesViewController
        let configurator = ImagesModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: vc, with: backdrops, with: posters)
        
        return vc
    }

}
