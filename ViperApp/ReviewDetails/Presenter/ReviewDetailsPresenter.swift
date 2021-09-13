//
//  ReviewDetailsReviewDetailsPresenter.swift
//  ViperApp
//
//  Created by Danishpan on 13/06/2021.
//  Copyright © 2021 Dair. All rights reserved.
//

class ReviewDetailsPresenter: ReviewDetailsModuleInput, ReviewDetailsInteractorOutput {
    weak var view: ReviewDetailsViewInput!
    var interactor: ReviewDetailsInteractorInput!
    var router: ReviewDetailsRouterInput!
    
    private var review: ReviewEntity.Review
    
    init(with review: ReviewEntity.Review) {
        self.review = review
//        print(review)
    }
    
    func viewIsReady() {

    }
}

extension ReviewDetailsPresenter: ReviewDetailsViewOutput {
    func getReviews() {
        view?.setReviewDetails(review)
    }
}
