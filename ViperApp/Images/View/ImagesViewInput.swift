//
//  ImagesImagesViewInput.swift
//  ViperApp
//
//  Created by Danishpan on 15/06/2021.
//  Copyright © 2021 Dair. All rights reserved.
//

protocol ImagesViewInput: class {

    /**
        @author Danishpan
        Setup initial state of the view
    */
    func setImages(_ backdrops: [ImagesEntity.Image], _ posters: [ImagesEntity.Image])
    func setupInitialState()
}
