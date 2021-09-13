//
//  ImagesImagesPresenter.swift
//  ViperApp
//
//  Created by Danishpan on 15/06/2021.
//  Copyright © 2021 Dair. All rights reserved.
//

class ImagesPresenter: ImagesModuleInput {

    weak var view: ImagesViewInput!
    var interactor: ImagesInteractorInput!
    var router: ImagesRouterInput!

    private var backdrops: [ImagesEntity.Image]
    private var posters: [ImagesEntity.Image]

    init(with backdrops: [ImagesEntity.Image], with posters: [ImagesEntity.Image]) {
        self.backdrops = backdrops
        self.posters = posters
    }
    
    func viewIsReady() {

    }
}

extension ImagesPresenter: ImagesViewOutput {
    func getImages() {
        view?.setImages(backdrops, posters)
    }
}

extension ImagesPresenter: ImagesInteractorOutput {
}

